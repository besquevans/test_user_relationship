class Post < ApplicationRecord
  validates :title, :content, presence: true

  belongs_to :user, counter_cache: true
  has_many :comments
end
