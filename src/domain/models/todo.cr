# # Todo Class
#
# Represents a todo item.
#
# ## Properties
# - `id` (type: `String`): The unique identifier of the todo item.
# - `title` (type: `String`): The title or description of the todo item.
# - `completed` (type: `Bool`, optional): Indicates whether the todo item is completed or not.
#
# ## Example Usage
#
# todo = Todo.new(1, "Buy groceries", false)
# puts todo.id # Output: 1
# puts todo.title # Output: "Buy groceries"
# puts todo.completed # Output: false
#
# ## Public Methods
# - `new(id : String, title : String, completed : Bool)`: Initializes a new instance of the `Todo` class with the provided values for `id`, `title`, and `completed`.
class Todo
  property id : String
  property title : String
  property? completed : Bool

  def initialize(@id : String, @title : String, @completed : Bool)
  end
end
