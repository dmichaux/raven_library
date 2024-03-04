class CollectionsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create update]

  def index
    @collections = Collection.alpha_order
  end

  def show
    @collection = Collection.includes(:writings).find params[:id]
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
