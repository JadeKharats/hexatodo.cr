require "./repository"
require "./outputport"

class TodoService
  property repository : TodoRepository
  property output_port : TodoOutputPort

  def initialize(@repository : TodoRepository, @output_port : TodoOutputPort)
  end

  def get_all_todos : Array(Todo)
    todos = repository.find_all
    output_port.display_todos(todos)
    todos
  end

  def get_todo_by_id(id : Int32) : Todo?
    todo = repository.find_by_id(id)
    output_port.display_todo_details(todo) if todo
    todo
  end

  def create_todo(title : String) : Todo
    todo = Todo.new(repository.find_all.size + 1, title, false)
    repository.save(todo)
    output_port.display_todo_created(todo)
    todo
  end

  def mark_todo_as_completed(todo : Todo) : Todo
    todo.completed = true
    output_port.display_todo_completed(todo)
    todo
  end
end
