# Table name: species
#
#  id         :integer
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#
class Species < ApplicationRecord
  has_many :trees
end
