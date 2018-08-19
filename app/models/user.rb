class User < ApplicationRecord
  has_many :notes
  has_many :vaccination_cards
  has_many :vaccinations, through: :vaccination_cards
  # attr_writer :login
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:user_name]
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
    if attr.blank?
      return "no information given"
    else
      return attr
    end
  end

  #def login later email and username are valid
  #  @login || self.user_name || self.email
  #end
end
