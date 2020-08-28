class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :url
      t.string :ingredients
      t.string :calories
      t.string :daily_value
      t.string :servings
      t.string :img
      t.string :source
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
