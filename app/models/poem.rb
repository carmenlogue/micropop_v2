class Poem < ActiveRecord::Base
	has_and_belongs_to_many :tags
	has_and_belongs_to_many :categories
	belongs_to :song

  validates_uniqueness_of :reference

  before_create :create_reference

  private

  def create_reference
    self.reference = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
end
