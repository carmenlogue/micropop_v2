require 'csv'

namespace :images_import do

  desc 'import images names from csv to local DB'
  task :from_csv_to_db => :environment do
    CSV.foreach('images_data_v2.csv') do |row|
      begin
        # Prepare data
        poem = Poem.find row[0]
        image_name = row[1].gsub(/\;/,',')

        # Create new images
        poem.image = Rails.root.join("public/#{image_name}").open
        poem.save!

        puts "Image in row #{row[0]} added"
      rescue
        "Error creating data for a poem image in row: #{row}"
      end
    end
  end

end
