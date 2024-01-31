require "../../domain/ports/todo_repository"

# InMemoryTodoRepository is a class that represents an in-memory implementation of a TodoRepository.
# It extends the TodoRepository class and provides methods for finding and saving todos.
#
# Example usage:
#
# ```
# repository = InMemoryTodoRepository.new
# todos = repository.find_all
# todo = repository.find_by_id(1)
# saved_todo = repository.save(todo)
# ```
#
# @property todos [Array(Todo)] The array of todos in the repository.
class InMemoryTodoRepository < TodoRepository
  property todos : Array(Todo) = [] of Todo

  # Returns all the todos in the repository.
  #
  # @return [Array(Todo)] The list of all todos.
  def find_all : Array(Todo)
    todos
  end

  # Finds a todo by its ID.
  #
  # @param id [String] The ID of the todo to find.
  # @return [Todo?] The todo with the matching ID, or `nil` if not found.
  def find_by_id(id : String) : Todo?
    todos.find { |todo| todo.id == id }
  end

  # Saves a new todo to the repository.
  #
  # @param todo [Todo] The todo to save.
  # @return [Todo] The saved todo.
  def save(todo : Todo) : Todo
    todos << todo
    todo
  end
end
