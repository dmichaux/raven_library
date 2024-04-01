class CollectionsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create update]
  before_action :find_genre, only: %i[new]

  def show
    @collection = Collection.includes(:writings).find params[:id]
    @writings = @collection.published_writings.by_position unless user_signed_in?
    @writings = @collection.writings.by_position if user_signed_in?
  end
  
  def new
    @collection = @genre.collections.build
  end
  
  def create
    @collection = Collection.new(create_collection_params)
    redirect_to(@collection.save ? @collection : @collection.genre)
  end
  
  # So far, only for (un)publishing
  # TODO: should be calling @collection.publish, instead
  def update
    @collection = Collection.find params[:id]
    @collection.update(update_collection_params)
    redirect_to @collection
  end

  # ===
  private
  # ===

  def create_collection_params
    params.require(:collection).permit(:name, :genre_id)
  end

  def update_collection_params
    params.require(:collection).permit(:published_at)
  end

  def find_genre
    @genre = Genre.find params[:genre_id]
  end
end
