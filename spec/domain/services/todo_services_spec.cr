require "../../spec_helper"

class FakeRepository < TodoRepository
  property todos : Array(Todo) = [] of Todo

  def find_all : Array(Todo)
    todos
  end

  def find_by_id(id : String) : Todo?
    todos.find { |todo| todo.id == id }
  end

  def save(todo : Todo) : Todo
    todos << todo
    todo
  end
end

class FakeOutputAdapter < TodoOutputPort
  getter io : IO

  def initialize(@io = STDOUT)
  end

  def display_todos(todos : Array(Todo)) : Nil
    todos.each do |todo|
      @io.puts "#{todo.id}. #{todo.title} - #{todo.completed? ? "Completed" : "Pending"}"
    end
  end

  def display_todo_details(todo : Todo) : Nil
    @io.puts "ID: #{todo.id}"
    @io.puts "Title: #{todo.title}"
    @io.puts "Status: #{todo.completed? ? "Completed" : "Pending"}"
  end

  def display_todo_created(todo : Todo) : Nil
    @io.puts "Todo created: #{todo.title}"
  end

  def display_todo_completed(todo : Todo) : Nil
    @io.puts "Todo completed: #{todo.title}"
  end
end

describe TodoService do
  repository = FakeRepository.new
  io = IO::Memory.new
  outputport = FakeOutputAdapter.new(io)
  service = TodoService.new(repository, outputport)

  it "retrieves all todos from the repository and displays them" do
    repository.todos = [
      Todo.new("1", "Todo 1", false),
      Todo.new("2", "Todo 2", false),
    ]
    service.all_todos
    output = io.rewind.gets_to_end
    io.clear
    output.should contain "1. Todo 1 - Pending"
    output.should contain "2. Todo 2 - Pending"
  end

  it "retrieves a todo by id from the repository and displays its details" do
    repository.todos = [Todo.new("1", "Todo 1", false)]
    service.get_todo_by_id("1")
    output = io.rewind.gets_to_end
    io.clear
    output.should contain "ID: 1"
    output.should contain "Title: Todo 1"
    output.should contain "Status: Pending"
  end

  it "creates a new todo with a given title, saves it to the repository, and displays the created todo" do
    repository.todos = Array(Todo).new
    service.create_todo("Todo 3")
    output = io.rewind.gets_to_end
    io.clear
    output.should eq "Todo created: Todo 3\n"
    todo = repository.todos.first
    todo.completed?.should be_false
  end

  it "mark as completed a selected todo" do
    repository.todos = [
      Todo.new("1", "Todo 1", false),
      Todo.new("2", "Todo 2", false),
    ]
    todo = repository.todos.first
    service.mark_todo_as_completed(todo)
    todo.completed?.should be_true
    repository.todos[0].completed?.should be_true
  end
end
