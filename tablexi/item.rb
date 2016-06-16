class Item
  attr_reader :description, :price

  def initialize(arg={})
    @description = arg[:description]
    @price = arg[:price]
  end

end