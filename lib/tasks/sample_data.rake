task(:fake_data => :environment) do

  User.destroy_all

  50.times do
    x = User.new
    x.first_name = Faker::Name.first_name
    x.last_name = Faker::Name.last_name
    x.email = "#{x.first_name}.#{x.last_name}@example.com"
    x.password = "password"
    x.favorite_game = Game.pluck(:title).sample
    x.bio = Faker::TvShows::Friends.quote
    x.save
  end

  puts "Added #{User.all.length} fake users to the 'users' table."

end
