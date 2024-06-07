puts 'Seeding users...'

User.create!(name: 'mike',
             password: 'password')

User.create!(name: 'bob',
             password: 'password')

puts 'Seeding todos...'

User.all.each do |user|
  2.times do
    Todo.create!(
      title: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph,
      user:
    )
  end
end

puts 'Seeding todolists...'

Todo.all.each do |todo|
  3.times do
    Todolist.create!(
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      details: Faker::Lorem.sentence,
      todo:
    )
  end
end

puts 'Seeding completed.'
