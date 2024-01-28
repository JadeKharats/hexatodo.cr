require "./todo"

# # Todo Repository
#
# Abstract class `TodoRepository` defines three abstract methods: `find_all`, `find_by_id`, and `save`.
#
# ## Example Usage
# ```crystal
# repository = TodoRepository.new
#
# todos = repository.find_all
# # Returns an array of all todos
#
# todo = repository.find_by_id(1)
# # Returns the todo with the specified id, or nil if not found
#
# new_todo = Todo.new("New Todo")
# saved_todo = repository.save(new_todo)
# # Saves the new todo and returns the saved todo
# ```
#
# ## Methods
# - `find_all` : `Array(Todo)`
#   - Returns an array of all todos.

# - `find_by_id(id : Int32)` : `Todo?`
#   - Returns the todo with the specified id, or `nil` if not found.

# - `save(todo : Todo)` : `Todo`
#   - Saves the `todo` object and returns the saved todo.
abstract class TodoRepository
  abstract def find_all : Array(Todo)
  abstract def find_by_id(id : Int32) : Todo?
  abstract def save(todo : Todo) : Todo
end
