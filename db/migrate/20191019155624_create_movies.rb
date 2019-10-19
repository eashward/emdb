class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :description
      t.integer :rating, null: false
      t.string :category
      t.timestamps
    end
  end
end
