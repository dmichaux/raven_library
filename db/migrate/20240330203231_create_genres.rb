class CreateGenres < ActiveRecord::Migration[7.1]
  def change
    create_table :genres do |t|
      t.string :name, null: false
      t.datetime :published_at
      t.datetime :archived_at
      t.timestamps
    end
  end
end
