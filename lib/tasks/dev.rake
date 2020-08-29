namespace :dev do
  task fake_user: :environment do
    User.destroy_all

    10.times do |i|
      User.create!(
        email: Faker::Internet.email,
        password: "123456",
        # remote_image_url: 'https://visualhunt.com/photos/l/7/architecture-store-building.jpg'
      )
    end
    puts "user成功建立"
    puts "You have #{User.count} users data"
  end

  task fake_follow: :environment do
    Follow.destroy_all

    User.all.each do |user|
      number = rand(3..6)
      @users = User.where.not(id: user.id).sample(number)
      @users.each do |u|
        Follow.create!(
          fan_id: user.id,
          following_id: u.id
        )
      end
      
    end
    puts "追蹤關聯成功建立"
    puts "You have #{Follow.count} follows data"
  end

  task fake_all: :environment do 
    Rake::Task["dev:fake_user"].invoke
    Rake::Task["dev:fake_follow"].invoke
  end
end