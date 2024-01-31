require "../../spec_helper"

describe Todo do
  it "should initialize todo with values" do
    todo = Todo.new("1", "Buy groceries", false)
    todo.id.should eq("1")
    todo.title.should eq("Buy groceries")
    todo.completed?.should be_false
  end
end
