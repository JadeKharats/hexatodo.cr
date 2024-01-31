require "../domain/ports/todo_output"

class ConsoleTodoOutputPort < TodoOutputPort
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
