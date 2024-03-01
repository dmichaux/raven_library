class WritingsController < ApplicationController
  # before_action :authenticate_user!, only: %i[new create]
  before_action :find_collection, only: %i[show new create]

  def show
    @writing = Writing.find params[:id]
  end

  def new
    @writing = @collection.writings.build
  end

  def create
    writing = Writing.new(writing_params)
    redirect_to collection_writing_path(@collection, writing) if writing.save
  end

  private

  def writing_params
    params.require(:writing).permit(:collection_id, :author_first, :author_middle, :author_last, :name, :content)
  end

  def find_collection
    @collection = Collection.find params[:collection_id]
  end
end
