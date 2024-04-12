class WritingsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update]
  before_action :find_writing_and_collection, only: %i[show create edit update]

  def show
    @writing.increment!(:views) unless user_signed_in?
  end

  def new
    @collection = Collection.find params[:collection_id]
    @writing = @collection.writings.build
  end

  def create
    if @writing.save
      redirect_to writing_path(@writing) 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @writing.update(writing_params)
      redirect_to @writing
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # ====
  private
  # ====

  def writing_params
    params.require(:writing).permit(:collection_id,
                                    :author_first,
                                    :author_middle,
                                    :author_last,
                                    :name,
                                    :published_at,
                                    :content)
  end

  def find_writing_and_collection
    @writing = params[:id] ? Writing.find(params[:id]) : Writing.new(writing_params)
    @collection = @writing.collection
  end
end
