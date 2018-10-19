class InitialDomainSchema < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :signature

      t.timestamps
    end

    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    create_table :poems do |t|
      t.string :fragment
      t.integer :song_id
      t.string :image
      t.string :reference, unique: true

      t.timestamps
    end

    create_table :poems_categories, id: false  do |t|
      t.integer :poem_id
      t.integer :category_id

      t.timestamps
    end

    create_table :poems_tags, id: false  do |t|
      t.integer :poem_id
      t.integer :tag_id

      t.timestamps
    end

    create_table :songs do |t|
      t.string :title
      t.integer :year
      t.integer :artist_id

      t.timestamps
    end

    create_table :tags do |t|
      t.string :name, index: true

      t.timestamps
    end

    add_index :poems, :song_id
    add_index :poems, :reference, unique: true
    add_index :songs, :artist_id
    add_index :poems_categories, :poem_id
    add_index :poems_categories, :category_id
    add_index :poems_tags, :poem_id
    add_index :poems_tags, :tag_id
  end
end
