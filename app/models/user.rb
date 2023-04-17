class User < ApplicationRecord
  def has_secure_password
    validates :email, presence: true, uniqueness: true
  end
end
