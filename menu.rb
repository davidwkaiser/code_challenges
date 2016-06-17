class Menu
  attr_reader :file, :items

  def initialize()
    @items = []
  end

  def load_file(filename)
    raw_file_data = []
    f = File.open(filename, "r")
    f.each_line do |line|
      raw_file_data << line.chomp
    end
    f.close
    raw_file_data
  end

  def remove_dollar_sign(raw_data_array)
    raw_data_array.each do |item|
      item.gsub!(/\$/, "")
    end
  end

  #takes the first line, sets as target amount, removes that line
  #so that the remainder is just menu items
  def set_target(raw_data_array)
    target_string = raw_data_array.shift
    $target = target_string.to_f
  end

  #menu items are converted into objects and
  #shoveled into an array
  def load_data(menu_data_array)
    all_items = []
    menu_data_array.each do |item|
      item_array = item.split(',')
      all_items << Item.new({description: item_array[0], price: item_array[1].to_f.round(2)})
    end
    @items = self.sort_by_price(all_items)
  end

  def sort_by_price(array)
    array.sort!{|a,b| a.price <=> b.price}
  end

  def sort_by_description(array)
    array.sort!{|a,b| a.description <=> b.description}
  end

  #this is the master function to gather data before sorting
  def get_data_from_file(filename)
    data_array = load_file(filename)
    remove_dollar_sign(data_array)
    set_target(data_array)
    load_data(data_array)
  end


  def cheapest_item
    return @items[0]
  end

  def most_expensive_item
    return @items[-1]
  end

  def min_number_of_items
    return ($target / self.most_expensive_item.price).ceil
  end

  def max_number_of_items
    return ($target / self.cheapest_item.price).floor
  end

  #builds a set of orders with a given number of items
  def build_a_set_of_orders(number_of_items)
    return @items.repeated_permutation(number_of_items).to_a
  end

  #builds a set of orders with numbers ranging from min to max
  #number of items
  def collect_possible_orders
    possible_orders = []
    for number_of_items in min_number_of_items..max_number_of_items
      possible_orders += build_a_set_of_orders(number_of_items)
    end
    return possible_orders
  end

  #tests if an order adds up to the target number, returns boolean
  def add_up?(order)
    total_cost_of_order = 0
    order.each do |item|
      total_cost_of_order += item.price
    end
    total_cost_of_order == $target
  end

  #generates a complete set of all possible solutions, if any
  def solve_with_dupes
    solutions = []
    all_possible_orders = collect_possible_orders
    all_possible_orders.each do |order|
      solutions << order if add_up?(order)
    end
    return solutions
  end

  #filters out the duplicate answers
  def solve_without_dupes
    all_solutions = solve_with_dupes
    all_solutions.each do |array|
      sort_by_description(array)
    end
    return all_solutions.uniq!
  end

  def pretty_print
    array_of_arrays = solve_without_dupes
    unless array_of_arrays
      printf "There are no solutions that add up to $%.2f \n", $target
    else
      counter = 1
      puts '*****'
      array_of_arrays.each do |array_of_objects|
        puts "solution number - #{counter}"
        puts "------"
        array_of_objects.each do |item|
          printf " $%.2f \t #{item.description} \n", item.price
        end # end for inner do-loop
        puts "------"
        printf "$%.2f \n", $target
        puts
        counter +=1
      end  #end for outer do-loop
    end #end of if-statement
  end #end for method

end