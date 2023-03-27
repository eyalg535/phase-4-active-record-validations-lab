class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  validate :title_sufficient

  def title_sufficient
    valid = ["Won't Believe", "Secret", "Top", "Guess"].any? { |phrase| title.to_s.include?  (phrase)  }
    unless valid
      errors.add(:title, "Title must be more click-baity!")
    end
  end
end
