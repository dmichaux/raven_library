class WritingsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create update]
  before_action :find_collection, only: %i[new]
  before_action :find_writing, only: %i[show edit update]

  def show
    @writing.increment! :views
    @collection = @writing.collection
  end

  def new
    @writing = @collection.writings.build
  end

  def create
    writing = Writing.new(writing_params)
    if writing.save
      redirect_to writing_path(writing) 
    else
      redirect_to writing.collection
    end
  end

  def edit;end

  def update
    @writing.update(writing_params)
    redirect_to @writing
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

  def find_collection
    @collection = Collection.find params[:collection_id]
  end

  def find_writing
    @writing = Writing.find params[:id]
  end
end
