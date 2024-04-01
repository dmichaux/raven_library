class WritingsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create update]
  before_action :find_collection, only: %i[new]
  before_action :find_writing, only: %i[show update]

  def show
    @writing = Writing.find params[:id]
    @collection = @writing.collection
  end

  def new
    @writing = @collection.writings.build
  end

  def create
    writing = Writing.new(create_writing_params)
    if writing.save
      redirect_to writing_path(writing) 
    else
      redirect_to writing.collection
    end
  end

  # So far, only for (un)publishing
  # TODO: should be calling @writing.publish, instead
  def update
    @writing.update(update_writing_params)
    redirect_to @writing
  end

  # ====
  private
  # ====

  def create_writing_params
    params.require(:writing).permit(:collection_id, :author_first, :author_middle, :author_last, :name, :content)
  end

  def update_writing_params
    params.require(:writing).permit(:published_at)
  end

  def find_collection
    @collection = Collection.find params[:collection_id]
  end

  def find_writing
    @writing = Writing.find params[:id]
  end
end
