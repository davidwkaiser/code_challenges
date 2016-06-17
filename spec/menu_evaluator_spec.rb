require_relative('../menu')

  menu1 = Menu.new

  small_data = [
    "$15.05",
    "mixed fruit,$2.15",
    "french fries,$2.75"
  ]

  small_data_without_dollars = [
    "15.05",
    "mixed fruit,2.15",
    "french fries,2.75"
  ]

describe 'Creates a menu of items' do

  it 'initializes a menu with empty items' do
    expect(menu1.items).to eq []
  end

  it 'strips out dollar signs' do
    expect(menu1.remove_dollar_sign(small_data)).to eq small_data_without_dollars
  end

  it 'sets the target correctly' do
    expect(menu1.set_target(small_data_without_dollars)).to eq 15.05
  end

  it 'creates a menu with the correct number of items' do
    expect(menu1.load_data(small_data_without_dollars).length).to eq 2
  end

  it 'determines the cheapest item' do
    expect(menu1.cheapest_item.price).to eq 2.15
  end

  it 'determines the most expensive item' do
    expect(menu1.most_expensive_item.price).to eq 2.75
  end



end