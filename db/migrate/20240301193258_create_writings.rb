class CreateWritings < ActiveRecord::Migration[7.1]
  def change
    create_table :writings do |t|
      t.belongs_to :collection
      t.string :author_first
      t.string :author_middle
      t.string :author_last
      t.integer :position # for acts_as_list
      t.string :name
      # t.text :content is handled by ActionText
      t.datetime :published_at
      t.datetime :archived_at
      t.integer :views, default: 0
      t.timestamps
    end
  end
end
