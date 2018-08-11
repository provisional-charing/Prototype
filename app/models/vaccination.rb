class Vaccination < ApplicationRecord
  belongs_to :disease
  has_many :vaccination_cards
  has_many :users, through: :vaccination_cards
end
