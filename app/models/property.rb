# Table name: properties
#
#  id         :integer
#  title      :string
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#
class Property < ApplicationRecord
  validates :title, presence: true

  belongs_to :user

  has_many :trees
  has_many :surveys
  has_many :inspections, through: :surveys
end
