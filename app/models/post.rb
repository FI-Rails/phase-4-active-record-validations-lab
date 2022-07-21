class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    # validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :title_is_clickbait

    def title_is_clickbait
        pattern = [
            /Won't Believe/i,
            /Secret/i,
            /top \d/i,
            /Guess/i
         ]
        if pattern.none? {|pat| pat.match title}
            errors.add(:title, "must be clickbait")
        end
    end
end
