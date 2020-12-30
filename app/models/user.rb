class User < ApplicationRecord
  
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates_confirmation_of :password
  
  has_secure_password

  has_many :properties
  has_many :surveys, through: :properties
  has_many :inspections, through: :surveys
  has_many :trees, through: :inspections
  
end