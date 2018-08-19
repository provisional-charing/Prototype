class User < ApplicationRecord
  has_many :vaccination_cards
  has_many :vaccinations, through: :vaccination_cards
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  enum role: [:admin, :user, :doc ]
  validates_presence_of :user_name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_uniqueness_of :user_name

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def is_not_given?(attr)
    if attr.is_empty?
      return "no information given"
    else
      return attr
    end

  end
end
