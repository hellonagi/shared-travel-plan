class MapsController < ApplicationController
  def index
    todos = Todo.limit(10)
    @todos = todos.map { |todo| build_response(todo) }
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