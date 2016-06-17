#xkcd variant on the knapsack problem
#does not need to be optimized
#input is a text file

require_relative "item"
require_relative "menu"
filename = ARGV[0]
$target = 0

menu = Menu.new
menu.get_data_from_file(filename)
menu.pretty_print