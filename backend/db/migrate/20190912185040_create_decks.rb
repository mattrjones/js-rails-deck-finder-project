class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
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
