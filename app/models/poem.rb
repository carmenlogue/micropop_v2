class Poem < ApplicationRecord
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :categories, join_table: :poems_categories
  belongs_to :song

  validates :reference, presence: true
  validates :reference, uniqueness: true

  before_create :create_reference

  private

  def create_reference
    self.reference = Digest::SHA1.hexdigest([Time.zone.now, rand].join)
  end
end
