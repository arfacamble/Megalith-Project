class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :megalith
  acts_as_votable

  # validates :text, length: { minimum: 15 }
end
