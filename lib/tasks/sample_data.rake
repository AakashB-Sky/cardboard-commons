task(:fake_data) do
  50.times do
    x = User.new
    x.first_name = Faker::Name.first_name
    x.last_name = Faker::Name.last_name
  end
end
