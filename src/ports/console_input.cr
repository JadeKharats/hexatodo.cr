require "../domain/inputport"
require "../domain/todoservices"

class ConsoleTodoInputPort < TodoInputPort
  property service : TodoService

  def initialize(@service : TodoService)
  end

  def get_all_todos : Array(Todo)
    service.get_all_todos
  end

  def get_todo_by_id(id : Int32) : Todo?
    service.get_todo_by_id(id)
  end

  def create_todo(title : String) : Todo
    service.create_todo(title)
  end

  def mark_todo_as_completed(todo : Todo) : Todo
    service.mark_todo_as_completed(todo)
  end
end
