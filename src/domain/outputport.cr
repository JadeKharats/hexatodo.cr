require "./todo"

# Abstract class representing a Todo output port.
#
# This abstract class defines four abstract methods that must be implemented by its subclasses:
# - `display_todos`: Displays the titles of all the todos in the given array.
# - `display_todo_details`: Displays the details of a single todo, including its title, description, and due date.
# - `display_todo_created`: Displays a message indicating that a todo has been created.
# - `display_todo_completed`: Displays a message indicating that a todo has been completed.
#
# Example Usage:
# ```crystal
# class ConsoleOutputPort < TodoOutputPort
#   def display_todos(todos : Array(Todo))
#     todos.each do |todo|
#       puts todo.title
#     end
#   end
#
#   def display_todo_details(todo : Todo)
#     puts "Title: #{todo.title}"
#     puts "Description: #{todo.description}"
#     puts "Due Date: #{todo.due_date}"
#   end
#
#   def display_todo_created(todo : Todo)
#     puts "Todo created: #{todo.title}"
#   end
#
#   def display_todo_completed(todo : Todo)
#     puts "Todo completed: #{todo.title}"
#   end
# end
# ```
#
# Inputs:
# - `todos` : An array of `Todo` objects.
# - `todo` : A single `Todo` object.
#
# Flow:
# - The `display_todos` method takes an array of `Todo` objects as input and displays the titles of all the todos.
# - The `display_todo_details` method takes a single `Todo` object as input and displays the details of the todo.
# - The `display_todo_created` method takes a single `Todo` object as input and displays a message indicating that the todo has been created.
# - The `display_todo_completed` method takes a single `Todo` object as input and displays a message indicating that the todo has been completed.
#
# Outputs:
# - None
abstract class TodoOutputPort
  abstract def display_todos(todos : Array(Todo)) : Nil
  abstract def display_todo_details(todo : Todo) : Nil
  abstract def display_todo_created(todo : Todo) : Nil
  abstract def display_todo_completed(todo : Todo) : Nil
end
