class Note < ApplicationRecord
  belongs_to :user, optional: false
end
