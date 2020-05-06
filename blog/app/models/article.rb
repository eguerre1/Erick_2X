class Article < ApplicationRecord
    belongs_to :user
    has_many :stars, dependent: :destroy
    
    has_many :comments, dependent: :destroy
    has_one_attached :image
    
    validate :title_filter 
    # validates :title, presence: true, length: { minimum: 5 }
    #     my_string = "Schoop"
    #     if my_string.include? "Schoop"
    #       false
    #     end
    validates :text, presence: true, length: { minimum: 10 }
    
    def title_filter
        bad_words = ['xxx', 'poop', 'floop', 'idiot']
        if bad_words.include? self.title
            errors.add(:base,'Title contains profanity')
        end 
    end 
end
    