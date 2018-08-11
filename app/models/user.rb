class User < ApplicationRecord
  has_many :vaccination_cards
  has_many :vaccinations, through: :vaccination_cards
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :user_name
  validates_presence_of :email
  validates_uniqueness_of :email
end
