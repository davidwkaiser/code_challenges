#xkcd variant on the knapsack problem
#does not need to be optimized
#input is a text file

require_relative "item"
require_relative "menu"
filename = ARGV[0]
$target = 0

menu = Menu.new

# p menu.cheapest_item
# p menu.max_number_of_items
# p menu.most_expensive_item
# p menu.min_number_of_items
#p menu.build_a_set_of_orders(2).to_a
# x =  menu.build_a_set_of_orders(7)
# p x[0]
# p menu.add_up?(x[0])
# x = menu.solve_without_dupes
# x.each do |variant|
#   p variant
#   p "***"
# end

# menu.pretty_print
# file = "menu.txt"
# menu.load_file(file)
# puts
# menu_item_test = "french fries,$2.75"
# #p menu.remove_dollar_sign(menu_item_test)

# test_me = ["15.05", "mixed fruit,2.15", "french fries,2.75"]
# menu.set_target(test_me)
# p test_me
# p menu.load_data(test_me)
menu.get_data_from_file(filename)
menu.pretty_print