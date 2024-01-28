require "./todo"

abstract class TodoInputPort
  abstract def get_all_todos : Array(Todo)
  abstract def get_todo_by_id(id : Int32) : Todo?
  abstract def create_todo(title : String) : Todo
  abstract def mark_todo_as_completed(todo : Todo) : Todo
end
