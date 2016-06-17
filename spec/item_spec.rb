require_relative('../item')

describe 'Creates an item' do
  item = Item.new({description: "salad", price: 5.99})
  it 'initializes an item' do
  expect(item.is_a?(Object)).to eq true
  end

  it 'sets the correct description' do
  expect(item.description).to eq 'salad'
  end

  it 'sets the correct price' do
  expect(item.price).to eq 5.99
  end


end