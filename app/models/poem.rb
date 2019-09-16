class Poem < ApplicationRecord
  searchkick word_start: [:fragment],
             settings: { number_of_shards: ENV.fetch('ELASTICSEARCH_SHARDS') }

  mount_uploader :image, ImageUploader

  has_and_belongs_to_many :tags
  has_and_belongs_to_many :categories, join_table: :poems_categories
  belongs_to :song

  delegate :artist, to: :song

  validates :fragment,  presence:   true
  # validates :image,     presence:   true
  validates :reference, uniqueness: true

  before_create :create_reference

  def search_data
    {
      fragment: fragment,
      song_id: song.id,
      artist_id: song.artist.id,
      tag_ids: tags.pluck(:tag_id)
    }
  end

  def to_param
    reference
  end

  private

  def create_reference
    self.reference = Digest::SHA1.hexdigest([Time.zone.now, rand].join)
  end
end
