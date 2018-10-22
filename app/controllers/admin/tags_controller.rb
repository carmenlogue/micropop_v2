module Admin
  class TagsController < AdminController
    before_action :set_tag, only: [:show, :edit, :update, :destroy]

    def index
      results = if params[:query]
                  Tag.all.order(:name).where('lower(name) LIKE ?', "%#{params[:query].downcase}%")
                else
                  Tag.all.order(:name)
                end
      @tags = results.page(params[:page])
    end

    def new
      @tag = Tag.new
    end

    def create
      @tag = Tag.new(tag_params)
      if @tag.save
        redirect_to success_path, notice: 'Successfully created tag.'
      else
        render :new
      end
    end

    def show; end

    def edit; end

    def update
      if @tag.update(tag_params)
        redirect_to success_path, notice: 'Successfully updated tag.'
      else
        render :edit
      end
    end

    def destroy
      @tag.destroy
      redirect_to admin_tags_path, notice: 'Successfully deleted tag.'
    end

    private

    def set_tag
      @tag = Tag.find(params[:id])
    end

    def tag_params
      params[:tag].permit(:name)
    end

    def success_path
      admin_tag_path(@tag)
    end
  end
end
