class Artist < ApplicationRecord
  searchkick word_start: [:name]

  has_many :songs, dependent: :destroy

  def poems
    songs.flat_map(&:poems)
  end
end
