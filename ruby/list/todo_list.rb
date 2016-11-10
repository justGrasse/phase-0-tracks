class TodoList

  attr_accessor :chores

  def initialize(input_chores)
    @chores = input_chores
  end

  def get_items
    @chores  
  end

  def add_item(new_item)
    @chores.push(new_item)
  end

  def delete_item(bad_item)
    @chores.delete(bad_item)
  end

  def get_item(input_index)
    @chores[input_index]
  end

end