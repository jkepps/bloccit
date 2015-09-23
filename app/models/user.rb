class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_save do
    name_array = self.name.split(" ")
    name_array.each do |n|
      n.capitalize!
    end
    self.name = name_array.join(" ")
  end

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  NAME_REGEX = /(([A-Z]+\w+)\s[A-Z]+\w+)/

  validates :name,
            length: { minimum: 1, maximum: 100 },
            presence: true,
            format: { with: NAME_REGEX }
  validates :password,
            presence: true,
            length: { minimum: 6 }
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 100 },
            format: { with: EMAIL_REGEX }

  has_secure_password
end
