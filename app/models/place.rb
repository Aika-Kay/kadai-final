class Place < ApplicationRecord
  belongs_to :user
  
  validates :place, presence: true, length: { maximum: 50 }
  validates :reason, presence: true, length: { maximum: 255 }
end
