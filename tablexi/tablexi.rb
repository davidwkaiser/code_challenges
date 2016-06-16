#xkcd variant on the knapsack problem
#does not need to be optimized
#data

require_relative "item"
require_relative "menu"
#require_relative "data"

status = false
final_order = []
TARGET = 15.05
DATA = [
["mixed fruit", 2.15],
["french fries", 2.75],
["side salad", 3.35],
["hot wings", 3.55],
["mozzarella sticks", 4.20],
["sampler plate", 5.80],
]



menu = Menu.new
menu.load_data(DATA)
#final_order = menu.solve(target, order = [])
#puts "the final order is"
#final_order.each {|item| puts item}
#menu.solve(target, [])
# p menu.cheapest_item
# p menu.max_number_of_items
# p menu.most_expensive_item
# p menu.min_number_of_items
#p menu.build_a_set_of_orders(2).to_a
# x =  menu.build_a_set_of_orders(7)
# p x[0]
# p menu.add_up?(x[0])
x = menu.solve
x.each do |variant|
  p variant
  p "***"
end