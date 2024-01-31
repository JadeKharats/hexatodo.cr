require "../domain/ports/todo_input"
require "../domain/services/todo_services"

class ConsoleTodoInputPort < TodoInputPort
  property service : TodoService

  def initialize(@service : TodoService)
  end

  def all_todos : Array(Todo)
    service.all_todos
  end

  def get_todo_by_id(id : String) : Todo?
    service.get_todo_by_id(id)
  end

  def create_todo(title : String) : Todo
    service.create_todo(title)
  end

  def mark_todo_as_completed(todo : Todo) : Todo
    service.mark_todo_as_completed(todo)
  end
end
