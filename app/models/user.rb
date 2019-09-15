class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable
  def password_required?
    super && confirmed?
  end

  def active_for_authentication?
    super && confirmed?
  end

  def inactive_message
    confirmed? ? super : :needs_confirmation
  end
  
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :profile, presence: true, length: { maximum: 160 }
  
end
