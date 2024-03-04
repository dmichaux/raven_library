class CollectionsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create update]

  def index
    @collections = Collection.published.alpha_order unless user_signed_in?
    @collections = Collection.alpha_order if user_signed_in?
  end

  def show
    @collection = Collection.includes(:writings).find params[:id]
    @writings = @collection.published_writings.by_position unless user_signed_in?
    @writings = @collection.writings.by_position if user_signed_in?
  end
  
  def new
    @collection = Collection.new
  end
  
  def create
    @collection = Collection.new(collection_params)
    redirect_to @collection if @collection.save
  end
  
  # So far, only for (un)publishing
  # TODO: should be calling @collection.publish, instead
  def update
    @collection = Collection.find params[:id]
    @collection.update(update_collection_params)
    redirect_to @collection
  end

  private

  def create_collection_params
    params.require(:collection).permit(:name)
  end

  def update_collection_params
    params.require(:collection).permit(:published_at)
  end
end
