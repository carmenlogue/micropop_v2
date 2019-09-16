class Song < ApplicationRecord
  searchkick word_start: [:title, :year],
             settings: { number_of_shards: ENV.fetch('ELASTICSEARCH_SHARDS') }

  has_many :poems, dependent: :destroy
  belongs_to :artist

  validates :title,  presence: true
  validates :year,   presence: true
end
