class Snippet < ActiveRecord::Base
  MAX_LENGTH = 8192

  validates :content, presence: true, length: { maximum: MAX_LENGTH }

  scope :recent, -> { order(created_at: :desc) }
end
