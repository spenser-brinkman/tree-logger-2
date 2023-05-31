# Table name: inspections
#
#  id         :integer
#  survey_id  :integer
#  tree_id    :integer
#  height     :integer
#  dbh        :integer
#  foliage    :string
#  comments   :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#
class Inspection < ApplicationRecord
  belongs_to :survey
  belongs_to :tree
  belongs_to :user

  validates_presence_of :height, :dbh, :foliage

  scope :tallest, -> { where(height: self.maximum(:height)) }
end
