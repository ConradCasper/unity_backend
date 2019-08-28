class User < ApplicationRecord
    has_secure_password
    validates :first_name, :last_name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitve: false }
    validates_format_of :email, :with => /@/
end
