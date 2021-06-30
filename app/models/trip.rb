class Trip < ApplicationRecord
  has_many :trip_megaliths, dependent: :destroy
  has_many :other_locations
  has_many :trip_users, dependent: :destroy
  has_many :trip_photos, dependent: :destroy
  has_many :users, through: :trip_users
  has_many :megaliths, through: :trip_megaliths
  has_one :trip_chat_box

  validates :name, length: { minimum: 6 }
  validates :tagline, length: { minimum: 10 }

  after_update :update_visiteds, if: :visited?

  acts_as_votable

  def visited?
    date_visited
  end

  def update_visiteds
    users.each do |user|
      megaliths.each do |megalith|
        Visited.create(user: user, megalith: megalith)
      end
    end
  end
end
