require "./spec_helper"

describe InMemoryTodoRepository do
  repository = InMemoryTodoRepository.new

  it "save a todo" do
    todo = Todo.new(12, "Save a todo test", false)
    repository.save(todo)
    repository.todos.includes? todo
  end

  it "find all todos" do
    repository.save(Todo.new(1, "Plop", false))
    repository.save(Todo.new(2, "Plop", false))
    repository.save(Todo.new(3, "Plop", false))
    repository.save(Todo.new(4, "Plop", false))
    repository.find_all.should eq repository.todos
  end

  it "find a todo by id" do
    repository.save(Todo.new(5, "plika5", false))
    repository.save(Todo.new(6, "plika6", false))
    repository.save(Todo.new(7, "plika7", false))
    todo = repository.find_by_id(6)
    todo.should be_a Todo
    unless todo.nil?
      todo.title.should eq "plika6"
    end
  end
end

describe ConsoleTodoOutputPort do
  io = IO::Memory.new
  outputport = ConsoleTodoOutputPort.new(io)

  it "display lits of todos" do
    todos = [
      Todo.new(1, "Plop", false),
      Todo.new(2, "Plop", true),
      Todo.new(3, "Plop", false),
    ]
    outputport.display_todos(todos)
    console_output = io.rewind.gets_to_end
    todos.each do |todo|
      console_output.should contain "#{todo.id}. #{todo.title} - #{todo.completed? ? "Completed" : "Pending"}"
    end
  end

  it "display a todo details for a completed todos" do
    todo = Todo.new(4, "Pikachu", true)
    outputport.display_todo_details(todo)
    console_output = io.rewind.gets_to_end
    console_output.should contain "ID: #{todo.id}"
    console_output.should contain "Title: #{todo.title}"
    console_output.should contain "Status: Completed"
  end

  it "display a todo details for a pending todos" do
    todo = Todo.new(4, "Pikachu", false)
    outputport.display_todo_details(todo)
    console_output = io.rewind.gets_to_end
    console_output.should contain "ID: #{todo.id}"
    console_output.should contain "Title: #{todo.title}"
    console_output.should contain "Status: Pending"
  end

  it "display a created todo" do
    outputport.display_todo_created(Todo.new(3, "pldege", false))
    console_output = io.rewind.gets_to_end
    console_output.should contain "Todo created: pldege"
  end

  it "display a completed todo" do
    outputport.display_todo_completed(Todo.new(4, "dezgege", true))
    console_output = io.rewind.gets_to_end
    console_output.should contain "Todo completed: dezgege"
  end
end

describe TodoService do
  repository = InMemoryTodoRepository.new
  io = IO::Memory.new
  outputport = ConsoleTodoOutputPort.new(io)
  service = TodoService.new(repository, outputport)

  it "create a todo from title" do
    todo = service.create_todo("pikafe")
    todo.completed?.should eq false
    todo.title.should eq "pikafe"
  end
end

