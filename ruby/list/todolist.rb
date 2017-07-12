class TodoList
  attr_accessor :array

  def initialize(array)
    @array = array
  end

  def get_items
    @array
  end

  def add_item(item)
    @array.push(item)
  end

  def delete_item(item)
    @array.delete(item)
  end

  def get_item(number)
    index = @array[number]
    p index
  end

end
