class Song < ApplicationRecord
  searchkick word_start: [:title, :year]

  has_many :poems, dependent: :destroy
  belongs_to :artist
end
