namespace :dev do
  task fake_user: :environment do
    print "正在建立使用者資料"
    User.destroy_all
    
    10.times do
      user = User.create!(
        nick_name: Faker::Name.first_name,
        email: Faker::Internet.email,
        password: "123456",
      )
      image_url = Faker::Avatar.image(size: "50x50", format: "jpg")
      user.avatar.attach(io: open(image_url)  , filename: "avatar_#{user.id}.jpg")
      print "."
    end

    puts ""
    puts "成功建立 #{User.count} 筆 使用者資料！"
    puts User.last.email
  end

  task fake_follow: :environment do
    print "正在建立使用者追蹤資料"
    Follow.destroy_all

    User.all.each do |user|
      number = rand(3..6)
      @users = User.where.not(id: user.id).sample(number)
      @users.each do |u|
        Follow.create!(
          fan_id: user.id,
          following_id: u.id
        )
        print "."
      end
    end

    puts ""
    puts "成功建立 #{Follow.count} 筆 使用者追蹤資料！"
  end

  task fake_all: :environment do 
    Rake::Task["dev:fake_user"].invoke
    Rake::Task["dev:fake_follow"].invoke
  end
end