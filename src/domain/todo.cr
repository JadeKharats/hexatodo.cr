class Todo
  property id : Int32
  property title : String
  property? completed : Bool

  def initialize(@id : Int32, @title : String, @completed : Bool)
  end
end
