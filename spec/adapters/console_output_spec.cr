require "../spec_helper"

describe ConsoleTodoOutputPort do
  io = IO::Memory.new
  outputport = ConsoleTodoOutputPort.new(io)

  it "display lits of todos" do
    todos = [
      Todo.new("1", "Plop", false),
      Todo.new("2", "Plop", true),
      Todo.new("3", "Plop", false),
    ]
    outputport.display_todos(todos)
    console_output = io.rewind.gets_to_end
    todos.each do |todo|
      console_output.should contain "#{todo.id}. #{todo.title} - #{todo.completed? ? "Completed" : "Pending"}"
    end
  end

  it "display a todo details for a completed todos" do
    todo = Todo.new("4", "Pikachu", true)
    outputport.display_todo_details(todo)
    console_output = io.rewind.gets_to_end
    console_output.should contain "ID: #{todo.id}"
    console_output.should contain "Title: #{todo.title}"
    console_output.should contain "Status: Completed"
  end

  it "display a todo details for a pending todos" do
    todo = Todo.new("4", "Pikachu", false)
    outputport.display_todo_details(todo)
    console_output = io.rewind.gets_to_end
    console_output.should contain "ID: #{todo.id}"
    console_output.should contain "Title: #{todo.title}"
    console_output.should contain "Status: Pending"
  end

  it "display a created todo" do
    outputport.display_todo_created(Todo.new("3", "pldege", false))
    console_output = io.rewind.gets_to_end
    console_output.should contain "Todo created: pldege"
  end

  it "display a completed todo" do
    outputport.display_todo_completed(Todo.new("4", "dezgege", true))
    console_output = io.rewind.gets_to_end
    console_output.should contain "Todo completed: dezgege"
  end
end
