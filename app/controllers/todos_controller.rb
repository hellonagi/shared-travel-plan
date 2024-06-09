class TodosController < ApplicationController
  before_action :logged_in_user, only: %i[create search]
  require 'http'

  def index
    @todo = Todo.new
    todos = Todo.order(created_at: :desc).limit(20)
    @todos = todos.map { |todo| build_response(todo) }
    @form_slide_open = false
  end

  def create
    @todo = current_user.todos.build(todo_params)
    logger.debug "Todo params: #{todo_params.inspect}"

    # トランザクションで複数の `Todolist` とその画像を保存
    ActiveRecord::Base.transaction do
      if @todo.save
        attach_images_to_todolists
        redirect_to root_path, notice: 'Todo was successfully created.'
      else
        todos = Todo.limit(10)
        @todos = todos.map { |todo| build_response(todo) }
        @form_slide_open = true
        render :index, status: :unprocessable_entity
      end
    end
  rescue StandardError => e
    flash[:error] = "There was an error saving the Todo: #{e.message}"
    redirect_to root_path
  end

  def search
    data = search_places(params[:query])
    render json: data
  end

  private

  def search_places(query)
    api_key = ENV['GMAP_API_KEY']
    url = 'https://places.googleapis.com/v1/places:searchText'

    response = HTTP.post(
      url,
      headers: { 'Content-Type' => 'application/json',
                 'X-Goog-Api-Key': api_key,
                 'X-Goog-FieldMask': 'places.displayName,places.formattedAddress,places.location' },
      body: { textQuery: query, pageSize: 10, languageCode: 'ja', locationRestriction: {
        rectangle: {
          low: { latitude: 24.396308, longitude: 122.934570 },
          high: { latitude: 45.551483, longitude: 153.986672 }
        }
      } }.to_json
    )

    if response.status.success?
      JSON.parse(response.body.to_s)['places']
    else
      []
    end
  end

  def build_response(todo)
    {
      id: todo.id,
      title: todo.title,
      description: todo.description,
      author: todo.user.name,
      image: todo.todo_lists.first&.image || nil,
      list: todo.todo_lists
    }
  end

  def attach_images_to_todolists
    params[:todo][:todo_lists_attributes].each do |_index, todolist_params|
      next unless todolist_params[:image].present?

      todolist = @todo.todo_lists.find_by(id: todolist_params[:id])
      if todolist
        logger.debug "Attaching image to Todolist: #{todolist.inspect}"
        todolist.image.attach(todolist_params[:image])
      else
        flash[:error] = 'Todolist not found for attaching image.'
      end
    end
  end

  def todo_params
    params.require(:todo).permit(:title, :description,
                                 todo_lists_attributes: %i[id latitude longitude details _destroy image])
  end
end
