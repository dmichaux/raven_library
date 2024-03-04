class CreateCollections < ActiveRecord::Migration[7.1]
  def change
    create_table :collections do |t|
      t.string :name
      t.datetime :published_at
      t.datetime :archived_at
      t.timestamps
    end
  end
end
