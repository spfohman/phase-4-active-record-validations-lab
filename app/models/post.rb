class Post < ApplicationRecord
    validates :title, presence: true 
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :click_bait? 

    CLICKBAIT_PATTERNS = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]

    def click_bait? 
        if CLICKBAIT_PATTERNS.none? {|x| x.match title}
            errors.add(:title, "Title must contain clickbait!")
        end
    end

end
