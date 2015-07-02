class Snippet < ActiveRecord::Base
  MAX_LENGTH = 8192

  validates :content, presence: true, length: { maximum: MAX_LENGTH }

  before_create :set_token_id

  scope :recent, -> { order(created_at: :desc) }

  def self.public
    where(private: false)
  end

  def to_param
    token_id
  end

  private

  def set_token_id
    self.token_id = SecureRandom.uuid
  end
end
