# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'

APP_ID = "f9786791"
APP_KEY = "e2d8b78fda624305539beaae88c28eee"

API = "https://api.edamam.com/search?q=chicken&app_id=#{APP_ID}&app_key=#{APP_KEY}&from=0&to=1"
rm = RestClient.get API
rm_array = JSON.parse(rm)["hits"]





Comment.destroy_all
Comment.reset_pk_sequence
Recipe.destroy_all
Recipe.reset_pk_sequence

User.destroy_all
User.reset_pk_sequence
Follow.destroy_all
Follow.reset_pk_sequence



# t.string :name
# t.string :url
# t.string :ingredients
# t.string :calories
# t.string :daily_value
# t.string :servings
# t.string :img
# t.string :source
# t.belongs_to :user, null: false, foreign_key: true


users = User.create([
{
    username: "trevor",
    password: "password"

},
{
    username: "Alexis",
    password: "password"
}
])
rm_array.each do |recipe|
  recipes =  Recipe.create([
    {    
        name: recipe["recipe"]["label"],
        url: recipe["recipe"]["url"], 
        ingredients: recipe["recipe"]["ingredientLines"],
        calories: recipe["recipe"]["calories"],
        daily_value: recipe["recipe"]["totalDaily"]["ENERC_KCAL"]["quantity"],
        servings: recipe["recipe"]["yield"],
        img: recipe["recipe"]["image"],
        source: recipe["recipe"]["source"],
        user_id: 2
    }]
    )

    comments = Comment.create([
        {
            content: "This is so great!",
            recipe_id: 1,
            commentable_id: 1,
            commentable_type: "Recipe",
            username: "Alexis"
        
        },
        {
            content: "This is so great!",
            recipe_id: 1,
            commentable_id: 1,
            commentable_type: "Comment",
            username: "Alexis"
        }
        ])

    follows = Follow.create([
        {
            follower_id: 1,
            followed_user_id: 2
        }
    ])
   end

   





