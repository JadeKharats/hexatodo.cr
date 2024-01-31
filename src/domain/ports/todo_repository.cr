require "../models/todo"

# # Todo Repository
#
# Abstract class `TodoRepository` defines three abstract methods: `find_all`, `find_by_id`, and `save`.
#
# ## Example Usage
#
# ```
# class ExampleRepository < TodoRepository
#   def find_all
#     ...
# end
#
# repository = ExampleRepository.new
# todos = repository.find_all
# todo = repository.find_by_id(1)
# new_todo = Todo.new("New Todo")
# saved_todo = repository.save(new_todo)
# ```
abstract class TodoRepository
  abstract def find_all : Array(Todo)
  abstract def find_by_id(id : String) : Todo?
  abstract def save(todo : Todo) : Todo
end
