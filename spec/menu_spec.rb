require_relative('../menu')

  menu1 = Menu.new

  data = [
    "$15.05",
    "mixed fruit,$2.15",
    "french fries,$2.75",
    "side salad,$3.35",
    "hot wings,$3.55",
    "mozzarella sticks,$4.20",
    "sampler plate,$5.80"
  ]

  data_without_dollars = [
    "15.05",
    "mixed fruit,2.15",
    "french fries,2.75",
    "side salad,3.35",
    "hot wings,3.55",
    "mozzarella sticks,4.20",
    "sampler plate,5.80"
  ]

describe 'Creates a menu of items' do

  it 'initializes a menu with empty items' do
    expect(menu1.items).to eq []
  end

  it 'strips out dollar signs' do
    expect(menu1.remove_dollar_sign(data)).to eq data_without_dollars
  end

  it 'sets the target correctly' do
    expect(menu1.set_target(data_without_dollars)).to eq 15.05
  end

  it 'creates a menu with the correct number of items' do
    expect(menu1.load_data(data_without_dollars).length).to eq 6
  end

  it 'determines the cheapest item' do
    expect(menu1.cheapest_item.price).to eq 2.15
  end

  it 'determines the most expensive item' do
    expect(menu1.most_expensive_item.price).to eq 5.80
  end

  it 'determines minimum number of items needed' do
    expect(menu1.min_number_of_items).to eq 3
  end

  it 'determines maximum number of items needed' do
    expect(menu1.max_number_of_items).to eq 7
  end

  it 'determines the set of possible orders' do
    expect((menu1.collect_possible_orders).length).to eq 335880
  end

  it 'determines if it found the right number of raw orders' do
    expect((menu1.solve_with_dupes).length).to eq 10
  end

  it 'determines if it found the right number of unique orders' do
    output = menu1.solve_without_dupes
    expect(output.length).to eq 2
  end


end