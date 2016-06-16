require 'csv'

class Menu
  attr_reader :file, :items

  def initialize() #will need to add "file" here later to read CSV
    #@file = file
    @items = []
  end

  def load_data(data)
    all_items = []
    data.each do |item|
      all_items << Item.new({description: item[0], price: item[1]})
    end
    @items = self.sort_by_price(all_items)
  end

  def sort_by_price(array)
    array.sort!{|a,b| a.price <=> b.price}
  end

  def cheapest_item
    return @items[0]
  end

  def most_expensive_item
    return @items[-1]
  end

  def max_number_of_items
    return (TARGET / self.cheapest_item.price).floor
  end

  def min_number_of_items
    return (TARGET / self.most_expensive_item.price).ceil
  end

  def build_a_set_of_orders(number_of_items)
    return @items.repeated_permutation(number_of_items).to_a
  end

  def collect_possible_orders
    possible_orders = []
    for number_of_items in min_number_of_items..max_number_of_items
      possible_orders += build_a_set_of_orders(number_of_items)
    end
    return possible_orders
  end

  def add_up?(order)
    total_cost_of_order = 0
    order.each do |item|
      total_cost_of_order += item.price
    end
    total_cost_of_order == TARGET
  end

  def solve
    solutions = []
    all_possible_orders = collect_possible_orders
    all_possible_orders.each do |order|
      solutions << order if add_up?(order)
    end
    return solutions
  end

end