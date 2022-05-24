class Person < ApplicationRecord
  has_many :phones
  has_many :emails
  has_many :addresses
  belongs_to :user
end
