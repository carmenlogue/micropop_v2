class Song < ActiveRecord::Base
	has_many :poems
	belongs_to :artist
end
