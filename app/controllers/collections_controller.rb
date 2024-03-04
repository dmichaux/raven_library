class CollectionsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

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

  private

  def collection_params
    params.require(:collection).permit(:name)
  end
end
