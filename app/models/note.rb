class Note < ApplicationRecord
  MAX_CONTENT_LENGTH = 140

  belongs_to :user, optional: false

  validates :content, length: { maximum: MAX_CONTENT_LENGTH }
end
