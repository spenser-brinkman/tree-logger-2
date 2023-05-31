# Table name: surveys
#
#  id          :integer
#  property_id :integer
#  user_id     :integer
#  date        :date
#  created_at  :datetime
#  updated_at  :datetime
#
class Survey < ApplicationRecord
  validates :date, presence: { message: 'You must select a survey date' }
  validates :date, uniqueness: { scope: :property_id, message: 'A survey on that date already exists' }

  has_many :inspections
  has_many :trees, through: :inspections
  belongs_to :user
  belongs_to :property
end
