class Tag < ApplicationRecord
  searchkick word_start: [:name]

  has_and_belongs_to_many :poems

  validates :name, presence: true
end
