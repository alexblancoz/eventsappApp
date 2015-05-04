class User < ActiveRecord::Base
   has_many :events
    before_save {self.email = email.downcase}
    validates :name, presence: true, length: {minimum: 2, maximum:40}
    validates :last_names, presence: true, length: {minimum: 2, maximum:40}
    validates :password, presence: true, length: {minimum: 5, maximum:30}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 105},
                                        uniqueness: {case_sensitive: false},
                                        format:{with: VALID_EMAIL_REGEX}
end