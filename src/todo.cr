require "./domain/repository"
require "./domain/inputport"
require "./domain/outputport"
require "./application/repositories/inmemory"
require "./ports/console_output"
require "./ports/console_input"

# Dependency Injection
todo_repository = InMemoryTodoRepository.new
todo_output_port = ConsoleTodoOutputPort.new
todo_service = TodoService.new(todo_repository, todo_output_port)
todo_input_port = ConsoleTodoInputPort.new(todo_service)

puts "list"
todos = todo_input_port.get_all_todos
puts "Completed!"
todo_input_port.mark_todo_as_completed(todos.first)
puts "list"
todo_input_port.get_all_todos
puts "list"
todo_input_port.get_all_todos
