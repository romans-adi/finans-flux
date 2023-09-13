user = User.create(
  name: 'Mister User',
  email: 'user@example.com',
  password: 'password'
)

categories = [
  { name: 'Groceries', icon: 'shopping-cart', author_id: user.id },
  { name: 'Utilities', icon: 'bolt', author_id: user.id },
  { name: 'Entertainments', icon: 'film', author_id: user.id },
  { name: 'Transportation', icon: 'car', author_id: user.id },
  { name: 'Fav Cafe', icon: 'https://assets.stickpng.com/images/602fed66ff753f000410e746.png', author_id: user.id },
  { name: 'Fav Market', icon: 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f0/AldiNord-WorldwideLogo.svg/1200px-AldiNord-WorldwideLogo.svg.png', author_id: user.id }
]

category_ids = categories.map do |category_data|
  Category.create(category_data).id
end

movements = [
  { name: 'Grocery Shopping', description: 'Weekly grocery shopping', amount: 150.0, category_id: category_ids[0], user_id: user.id },
  { name: 'Electricity Bill', description: 'Monthly electricity bill', amount: 80.0, category_id: category_ids[1], user_id: user.id },
  { name: 'Movie Night', description: 'Movie tickets and snacks', amount: 25.0, category_id: category_ids[2], user_id: user.id },
  { name: 'Gas Refill', description: 'Car gas refill', amount: 40.0, category_id: category_ids[3], user_id: user.id },
  { name: 'Morning Coffee', description: 'Enjoyed coffee in the morning', amount: 5.0, category_id: category_ids[4], user_id: user.id },
  { name: 'Lunch at Cafe', description: 'Lunch with friends at the cafe', amount: 20.0, category_id: category_ids[4], user_id: user.id },
  { name: 'Grocery Shopping', description: 'Weekly grocery shopping at the market', amount: 75.0, category_id: category_ids[5], user_id: user.id },
  { name: 'Fresh Produce', description: 'Purchased fresh produce at the market', amount: 30.0, category_id: category_ids[5], user_id: user.id }
]

movements.each do |movement_data|
  Movement.create(movement_data)
end
