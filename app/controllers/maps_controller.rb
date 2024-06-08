class MapsController < ApplicationController
  require 'http'

  def index
    todos = Todo.limit(10)
    @todos = todos.map { |todo| build_response(todo) }
    @form_slide_open = false
  end

  def search
    data = search_places(params[:query])
    render json: data
  end

  private

  def search_places(query)
    api_key = ENV['GMAP_API_KEY']
    url = "https://places.googleapis.com/v1/places:searchText"

    response = HTTP.post(
      url,
      headers: { 'Content-Type' => 'application/json',
                 'X-Goog-Api-Key': api_key,
                 'X-Goog-FieldMask': 'places.displayName,places.formattedAddress,places.location' },
      body: { textQuery: query, pageSize: 5, languageCode: 'ja', locationRestriction: {
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
      title: todo.title,
      description: todo.description,
      author: todo.user.name,
      image: todo.todo_lists.first.image
    }
  end
end
