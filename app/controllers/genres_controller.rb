class GenresController < ApplicationController
  before_action :authenticate_user!, only: %i[new create update]

  def index
    @genres = Genre.published.alpha_order unless user_signed_in?
    @genres = Genre.alpha_order if user_signed_in?
  end

  def show
    @genre = Genre.includes(:collections).find params[:id]
    @collections = @genre.published_collections.alpha_order unless user_signed_in?
    @collections = @genre.collections.alpha_order if user_signed_in?
  end
  
  def new
    @genre = Genre.new
  end
  
  def create
    @genre = Genre.new(create_genre_params)
    redirect_to @genre if @genre.save
  end
  
  def update
    @genre = Genre.find params[:id]
    @genre.update(update_genre_params)
    redirect_to @genre
  end

  private

  def create_genre_params
    params.require(:genre).permit(:name)
  end

  def update_genre_params
    params.require(:genre).permit(:published_at)
  end
end
