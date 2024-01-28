require "./repository"
require "./outputport"

# # TodoService
#
# A class that represents a service for managing todos.
#
# ## Initialization
#
# - `new(repository : TodoRepository, output_port : TodoOutputPort)`
#
#   Initializes a new instance of the TodoService class.
#
#   - `repository` - An instance of the TodoRepository class that provides methods for accessing and manipulating todos.
#   - `output_port` - An instance of the TodoOutputPort class that provides methods for displaying todos.
#
# ## Methods
#
# - `get_all_todos : Array(Todo)`
#   Retrieves all todos from the repository and displays them.
#   Returns an array of Todo objects representing all the todos retrieved from the repository.
#
# - `get_todo_by_id(id : Int32) : Todo?`
#   Retrieves a todo with the given id from the repository and displays its details.
#   - `id` - The id of the todo to retrieve.
#   Returns a Todo object representing the todo with the given id, or nil if no todo is found.
#
# - `create_todo(title : String) : Todo`
#   Creates a new todo with the given title, saves it to the repository, and displays the created todo.
#   - `title` - The title of the new todo.
#   Returns a Todo object representing the newly created todo.
#
# - `mark_todo_as_completed(todo : Todo) : Todo`
#   Marks the given todo as completed and displays the completed todo.
#   - `todo` - The todo to mark as completed.
#   Returns a Todo object representing the todo that was marked as completed.
class TodoService
  property repository : TodoRepository
  property output_port : TodoOutputPort

  # Initializes a new instance of the TodoService class.
  #
  # @param repository [TodoRepository] An instance of the TodoRepository class that provides methods for accessing and manipulating todos.
  # @param output_port [TodoOutputPort] An instance of the TodoOutputPort class that provides methods for displaying todos.
  def initialize(@repository : TodoRepository, @output_port : TodoOutputPort)
  end

  # Retrieves all todos from the repository and displays them.
  #
  # @return [Array(Todo)] An array of Todo objects representing all the todos retrieved from the repository.
  def get_all_todos : Array(Todo)
    todos = repository.find_all
    output_port.display_todos(todos)
    todos
  end

  # Retrieves a todo with the given id from the repository and displays its details.
  #
  # @param id [Int32] The id of the todo to retrieve.
  # @return [Todo?] A Todo object representing the todo with the given id, or nil if no todo is found.
  def get_todo_by_id(id : Int32) : Todo?
    todo = repository.find_by_id(id)
    output_port.display_todo_details(todo) if todo
    todo
  end

  # Creates a new todo with the given title, saves it to the repository, and displays the created todo.
  #
  # @param title [String] The title of the new todo.
  # @return [Todo] A Todo object representing the newly created todo.
  def create_todo(title : String) : Todo
    todo = Todo.new(repository.find_all.size + 1, title, false)
    repository.save(todo)
    output_port.display_todo_created(todo)
    todo
  end

  # Marks the given todo as completed and displays the completed todo.
  #
  # @param todo [Todo] The todo to mark as completed.
  # @return [Todo] A Todo object representing the todo that was marked as completed.
  def mark_todo_as_completed(todo : Todo) : Todo
    todo.completed = true
    output_port.display_todo_completed(todo)
    todo
  end
end
