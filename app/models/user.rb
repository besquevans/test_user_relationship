class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :followingships, foreign_key: :following_id, class_name: "Follow"
        has_many :followers, through: :followingships

        has_many :followerships, foreign_key: :follower_id, class_name: "Follow"
        has_many :followings, through: :followerships
end
