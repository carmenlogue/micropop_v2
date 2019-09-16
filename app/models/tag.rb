class Tag < ApplicationRecord
  searchkick word_start: [:name],
             settings: { number_of_shards: ENV.fetch('ELASTICSEARCH_SHARDS') }

  has_and_belongs_to_many :poems

  validates :name, presence: true
end
