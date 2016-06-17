require_relative('../menu')

describe 'Creates a menu of items' do
  it 'initializes a menu with empty items' do
    menu = Menu.new
  expect(menu.items).to eq []
  end
end