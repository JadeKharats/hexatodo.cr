require "./todo"

# Abstract class representing a Todo Input Port.
#
# This abstract class defines a set of abstract methods for managing todos.
#
# Example Usage:
# ```crystal
# # Create a concrete implementation of TodoInputPort
# class TodoInputPortImpl < TodoInputPort
#   def get_all_todos : Array(Todo)
#     # implementation goes here
#   end
#
#   def get_todo_by_id(id : Int32) : Todo?
#     # implementation goes here
#   end
#
#   def create_todo(title : String) : Todo
#     # implementation goes here
#   end
#
#   def mark_todo_as_completed(todo : Todo) : Todo
#     # implementation goes here
#   end
# end
# ```
#
# Inputs: None
#
# Flow:
# - The abstract class 'TodoInputPort' defines four abstract methods:
#   1. `get_all_todos` - This method returns an array of all todos.
#   2. `get_todo_by_id` - This method takes an integer id as input and returns the corresponding todo object, or nil if not found.
#   3. `create_todo` - This method takes a string title as input and creates a new todo object with the given title.
#   4. `mark_todo_as_completed` - This method takes a todo object as input and marks it as completed.
#
# Outputs:
# - The `get_all_todos` method returns an array of todos.
# - The `get_todo_by_id` method returns a todo object or nil.
# - The `create_todo` method returns a newly created todo object.
# - The `mark_todo_as_completed` method returns the updated todo object.
abstract class TodoInputPort
  abstract def get_all_todos : Array(Todo)
  abstract def get_todo_by_id(id : Int32) : Todo?
  abstract def create_todo(title : String) : Todo
  abstract def mark_todo_as_completed(todo : Todo) : Todo
end
