class Poem < ApplicationRecord
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :categories, join_table: :poems_categories
  belongs_to :song

  validates :reference, uniqueness: true

  before_create :create_reference

  def artist
    song.artist.name
  end

  def signature
    song.artist.signature
  end

  private

  def create_reference
    self.reference = Digest::SHA1.hexdigest([Time.zone.now, rand].join)
  end
end
