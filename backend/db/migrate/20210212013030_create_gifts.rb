class CreateGifts < ActiveRecord::Migration[6.1]
  def change
    create_table :gifts do |t|
      t.string :title
      t.integer :price
      t.string :description
      t.string :link
      t.string :image
      t.string :category

      t.timestamps
    end
  end
end
