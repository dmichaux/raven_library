class ChangeCollectionTeaserToBlurb < ActiveRecord::Migration[7.1]
  def change
    rename_column :collections, :teaser, :blurb
  end
end
