class Genre < ApplicationRecord
     has_many :lessons, dependent: :destroy

     validates :name, uniqueness: true, presence: true
end
