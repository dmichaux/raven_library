class WritingsController < ApplicationController
  # before_action :authenticate_user!, only: %i[new create]

  def show
    @writing = Writing.find params[:id]
    @collection = @writing.collection
  end

  def new
    @collection = Collection.find params[:collection_id]
    @writing = @collection.writings.build
  end

  def create
    writing = Writing.new(writing_params)
    redirect_to writing if writing.save
  end

  private

  def writing_params
    params.require(:writing).permit(:collection_id, :author_first, :author_middle, :author_last, :name, :content)
  end
end
