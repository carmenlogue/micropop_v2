class Song < ApplicationRecord
  has_many :poems, dependent: :destroy
  belongs_to :artist
end
