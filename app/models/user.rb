class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  # User can be admin
  has_one :admin

  # User owns many teams
  has_many :owned_teams, class_name: "Team", foreign_key: "owner_id"

  # Association through TeamRole
  has_many :team_roles
  has_many :teams, through: :team_roles
  has_many :roles, through: :team_roles

  validates :username, presence: true,
    uniqueness: {case_sensitive: false},
    format: {with: /\A[a-zA-Z0-9\-_.]+\z/},
    length: {minimum: 4}

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  # Override to use username or email for login
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", {value: login.downcase}]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def full_name
    [first_name, last_name].compact.join(" ")
  end

  def is_admin?
    admin.present?
  end
end
