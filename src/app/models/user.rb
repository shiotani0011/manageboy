class User < ApplicationRecord
            # Include default devise modules.
            devise :database_authenticatable, :registerable,
                    :recoverable, :rememberable, :validatable,
                  :omniauthable
            include DeviseTokenAuth::Concerns::User
  # has_secure_password

    # validates :email, presence: true
    # validates :email, uniqueness: true
    # validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
