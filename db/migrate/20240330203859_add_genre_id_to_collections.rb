class AddGenreIdToCollections < ActiveRecord::Migration[7.1]
  def change
    add_reference :collections, :genre, foreign_key: true
  end
end
