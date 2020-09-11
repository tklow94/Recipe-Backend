class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :recipe, null: false, foreign_key: true
      t.integer :commentable_id
      t.string :commentable_type
      t.integer :user_id
      t.string :username
      t.string :avatar

      t.timestamps
    end
  end
end

