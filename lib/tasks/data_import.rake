require 'csv'

namespace :data_import do

  desc 'import data from csv to local DB'
  task :from_csv_to_db => :environment do
    # Prepare DB to index poems for elasticsearch
    Artist.reindex
    Song.reindex
    Tag.reindex
    Poem.includes({ song: :artist }, :categories, :tags).reindex

	  CSV.foreach('excel_data_v2.csv') do |row|
	    begin
	    	# Prepare data
	    	name = row[0].gsub(/\;/,',')
	    	signature = row[4].gsub(/\;/,',')
	    	title = row[1].gsub(/\;/,',')
	    	fragment = row[2].gsub(/\;/,',')
	    	tags_array = row[5].present? ? row[5].split(/\;/) : []

				# Create new objects if they do not exist
        artist = Artist.find_or_create_by(name: name, signature: signature)
				song = Song.find_or_create_by(artist_id: artist.id, title: title, year: row[3])
				poem = Poem.find_or_create_by(song_id: song.id, fragment: fragment)

        puts "Poem added: #{poem.id}"

				tags_array.each do |tag|
					poem.tags << Tag.find_or_create_by(name: tag.strip)
        end

        puts "Tags added for poem #{poem.id}"
		  rescue
	      "Error creating data for a poem in row: #{row}"
			end
	  end
  end

end
