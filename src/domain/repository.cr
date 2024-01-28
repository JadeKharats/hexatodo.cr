require "./todo"

abstract class TodoRepository
  abstract def find_all : Array(Todo)
  abstract def find_by_id(id : Int32) : Todo?
  abstract def save(todo : Todo) : Todo
end
