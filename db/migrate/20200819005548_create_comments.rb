class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :recipe, null: false, foreign_key: true
      t.integer :commentable_id
      t.string :commentable_type
      t.integer :user_id

      t.timestamps
    end
  end
end
# class CreateComments < ActiveRecord::Migration[6.0]
#   def change
#     create_table :comments do |t|
#       t.text :content
#       t.integer :user_id
#       t.integer :recipe_id
#       t.integer :parent_id
      
      

#       t.timestamps
#     end
#   end
# end
