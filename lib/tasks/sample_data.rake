task(:fake_data => :environment) do

  # ------------------------------ destroy and populate the "users" table ------------------------------
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

  # ------------------------------ destroy and populate the "friendships" table ------------------------------
  Friendship.destroy_all


  100.times do
    x = Friendship.new
    x_inverse = Friendship.new

    user = User.offset(rand(User.count)).first
    friend = User.offset(rand(User.count)).first

    while user.id == friend.id do
      friend = User.offset(rand(User.count)).first
    end
    
    # populate friendship: user -> friend
    x.user_id = user.id
    x.friend_id = friend.id
    x.save

    # populate inverse friendship: friend -> user
    x_inverse.user_id = friend.id
    x_inverse.friend_id = user.id
    x_inverse.save

  end

  puts "Added #{Friendship.all.length} records to the 'friendships' table (#{Friendship.all.length / 2} friend pairs)."

  # ------------------------------ destroy and populate the "events" table ------------------------------
  Event.destroy_all

  10.times do
    x = Event.new
    x.date = Faker::Date.between(from: 10.days.ago, to: 30.days.from_now)
    x.time = Faker::Time.between(from: Time.parse("12:00"), to: Time.parse("21:00")).strftime("%H:%M:%S") # a random time between 12pm and 9pm
    x.game_id = Game.offset(rand(Game.count)).first.id
    x.skill_level = ["Beginner Friendly", "Experienced Players", "Competitive"].sample
    x.host_id = User.offset(rand(User.count)).first.id
    x.seats_total = rand(4..10)
    x.neighborhood = Faker::Address.community
    x.street_address = Faker::Address.street_address
    x.address_line_2 = Faker::Address.secondary_address
    x.city = Faker::Address.city
    x.state = Faker::Address.state_abbr
    x.zip_code = Faker::Address.zip
    x.description = Faker::TvShows::GameOfThrones.quote
    
    # event visibility
    random_number = rand
    if rand > 0.5
      x.visibility = "Public"
    elsif rand > 0.2
      x.visibility = "Semi-private (friends, friends of friends)"
    else
      x.visibility = "Private (friends only)"
    end

    # event approval requirement
    random_number = rand
    if rand > 0.7
      x.approval_requirement = "Anyone can join"
    elsif rand > 0.4
      x.approval_requirement = "Friends & friends of friends"
    elsif rand > 0.2
      x.approval_requirement = "Friends only"
    else
      x.approval_requirement = "Host approval required"
    end

    # event status
    random_number = rand
    if Date.today > x.date
      x.status = "Past"
    else
      if random_number > 0.2
        x.status = "Upcoming"
      else
        x.status = "Cancelled"
      end
    end
    
    x.save
  end
  puts "Added #{Event.all.count} fake events to the 'events' table."

end
