class Artist < ApplicationRecord
  searchkick word_start: [:name],
             settings: { number_of_shards: ENV.fetch('ELASTICSEARCH_SHARDS') }

  has_many :songs, dependent: :destroy

  validates :name,      presence: true
  validates :signature, presence: true

  def poems
    songs.flat_map(&:poems)
  end
end
