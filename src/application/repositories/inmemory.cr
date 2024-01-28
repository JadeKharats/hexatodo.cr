require "../../domain/repository"

class InMemoryTodoRepository < TodoRepository
  property todos : Array(Todo) = [] of Todo

  def find_all : Array(Todo)
    todos
  end

  def find_by_id(id : Int32) : Todo?
    todos.find { |todo| todo.id == id }
  end

  def save(todo : Todo) : Todo
    todos << todo
    todo
  end
end
