require "./domain/ports/todo_repository"
require "./domain/ports/todo_input"
require "./domain/ports/todo_output"
require "./application/repositories/inmemory"
require "./adapters/console_output"
require "./adapters/console_input"

# Dependency Injection
todo_repository = InMemoryTodoRepository.new
todo_output_port = ConsoleTodoOutputPort.new
todo_service = TodoService.new(todo_repository, todo_output_port)
ConsoleTodoInputPort.new(todo_service)
