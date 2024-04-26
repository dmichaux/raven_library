class AddFeaturedToWritings < ActiveRecord::Migration[7.1]
  def change
    add_column :writings, :featured, :boolean, default: false
  end
end
