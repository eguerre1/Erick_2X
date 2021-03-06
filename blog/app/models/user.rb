class User < ApplicationRecord
    has_many :articles
    has_many :stars
    
    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    before_save { self.email = email.downcase }
    
    # validate :name_filter 
    
    validates :name,
        presence: true,
        length: { maximum: 12 }
        #define blacklist in here
        my_string = "Kendall"
        if my_string.include? "Kendall"
           false
        end
     
    
    validates :email,
        presence: true,
        length: { maximum: 255 },
        format: { with: VALID_EMAIL_REGEX },
        uniqueness: { case_sensitive: false }
        
    validates :password,
        presence: true,
        length: { minimum: 6 }
        
    has_secure_password
end
