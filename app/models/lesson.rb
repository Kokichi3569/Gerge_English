class Lesson < ApplicationRecord

  attachment :image

  validates :lesson_name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

end
