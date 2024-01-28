require "./todo"

abstract class TodoOutputPort
  abstract def display_todos(todos : Array(Todo)) : Nil
  abstract def display_todo_details(todo : Todo) : Nil
  abstract def display_todo_created(todo : Todo) : Nil
  abstract def display_todo_completed(todo : Todo) : Nil
end
