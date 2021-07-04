class Post < ApplicationRecord

  has_many :tags, dependent: :destroy
  belongs_to :user
  attachment :image
end
