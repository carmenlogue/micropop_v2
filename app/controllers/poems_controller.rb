class PoemsController < ApplicationController
  def index
    poem_results = (
      search_by_song + search_by_artist + search_by_tag + search_by_poem
    ).uniq
    paginate_search_results(poem_results)
  end

  def show
    @poem = Poem.find_by(reference: params[:reference])
  end

  def autocomplete
    render json: Poem.search(
      params[:query],
      fields: ['fragment'],
      match: :word_start,
      limit: 10,
      load: false,
      misspellings: { below: 5 }
    ).map(&:fragment)
  end

  private

  def search_by_song
    song_ids = Song.search(params[:query], misspellings: false).results.pluck(:id)
    poem_results(song_id: song_ids)
  end

  def search_by_artist
    artist_ids = Artist.search(params[:query], misspellings: false).results.pluck(:id)
    poem_results(artist_id: artist_ids)
  end

  def search_by_tag
    tag_ids = Tag.search(params[:query], misspellings: false).results.pluck(:id)
    poem_results(tag_ids: tag_ids)
  end

  def search_by_poem
    Poem.search(params[:query], misspellings: false).results
  end
end
