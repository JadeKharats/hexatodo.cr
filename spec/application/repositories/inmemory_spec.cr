require "../../spec_helper"

describe InMemoryTodoRepository do
  repository = InMemoryTodoRepository.new

  it "save a todo" do
    todo = Todo.new("12", "Save a todo test", false)
    repository.save(todo)
    repository.todos.includes? todo
  end

  it "find all todos" do
    repository.save(Todo.new("1", "Plop", false))
    repository.save(Todo.new("2", "Plop", false))
    repository.save(Todo.new("3", "Plop", false))
    repository.save(Todo.new("4", "Plop", false))
    repository.find_all.should eq repository.todos
  end

  it "find a todo by id" do
    repository.save(Todo.new("5", "plika5", false))
    repository.save(Todo.new("6", "plika6", false))
    repository.save(Todo.new("7", "plika7", false))
    todo = repository.find_by_id("6")
    todo.should be_a Todo
    unless todo.nil?
      todo.title.should eq "plika6"
    end
  end
end
