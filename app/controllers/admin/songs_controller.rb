module Admin
  class SongsController < AdminController
    before_action :set_song, only: [:show, :edit, :update, :destroy]

    def index
      query = params[:query].presence || '*'
      results = Song.search(
        query,
        fields: ['title'],
        match: :word_start,
        misspellings: { below: 3 }
      ).results

      @songs = paginate_array(results)
    end

    def new
      @song = Song.new
    end

    def create
      @song = Song.new(song_params)
      if @song.save
        redirect_to success_path, notice: 'Successfully created song.'
      else
        render :new
      end
    end

    def show; end

    def edit; end

    def update
      if @song.update(song_params)
        redirect_to success_path, notice: 'Successfully updated song.'
      else
        render :edit
      end
    end

    def destroy
      @song.destroy
      redirect_to admin_songs_path, notice: 'Successfully deleted song.'
    end

    private

    def set_song
      @song = Song.find(params[:id])
    end

    def song_params
      params[:song].permit(:title, :year, :artist_id)
    end

    def success_path
      admin_song_path(@song)
    end
  end
end
