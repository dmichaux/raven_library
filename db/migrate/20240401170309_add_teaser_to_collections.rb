class AddTeaserToCollections < ActiveRecord::Migration[7.1]
  def change
    add_column :collections, :teaser, :text
  end
end
