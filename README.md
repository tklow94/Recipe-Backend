# Meal Time Backend
---
Meal Time is an Instagram-esque social media platform for sharing meals you have made for yourself or others. Users can customize their profile, follow other users, comment and reply to posts, explore user submitted and non-user submitted posts, search for users or recipes by name, and view a customized follower feed. Meal Time implemenets JWT Tokens to help authorize and authenticate users.

[Link](https://github.com/tklow94/Recipe-frontend) to frontend repository

# Motivation
---
Social media is an industry I am fascinated with because of it's ability to empower users to be their own brand and make connections worldwide. I wanted to understand the functionality behind the various components that are implemented in these platforms by building them out in this app.

# ScreenShots
---
Sign In
![Sign in](https://github.com/tklow94/Recipe-Backend/blob/master/app/images/Login.png?raw=true)
Profile
![Profile](https://github.com/tklow94/Recipe-Backend/blob/master/app/images/Profile.png?raw=true)
![Create Recipe](https://github.com/tklow94/Recipe-Backend/blob/master/app/images/Screen%20Shot%202020-09-15%20at%202.57.05%20PM.png?raw=true)
Post
![Post](https://github.com/tklow94/Recipe-Backend/blob/master/app/images/Recipe%20Card.png?raw=true)
Comments
![Comments](https://github.com/tklow94/Recipe-Backend/blob/master/app/images/Screen%20Shot%202020-09-15%20at%202.57.20%20PM.png?raw=true)
Feed
![Feed](https://github.com/tklow94/Recipe-Backend/blob/master/app/images/Feed.png?raw=true)
Explore
![Explore](https://github.com/tklow94/Recipe-Backend/blob/master/app/images/Screen%20Shot%202020-09-15%20at%202.57.40%20PM.png?raw=true)
Live Search Database
![Search Recipe](https://github.com/tklow94/Recipe-Backend/blob/master/app/images/Screen%20Shot%202020-09-15%20at%203.02.28%20PM.png?raw=true)
Live Search For Users/User Recipes
![Search Users/User Submissions](https://github.com/tklow94/Recipe-Backend/blob/master/app/images/User%20Search.png?raw=true)




# Tehcnologies Used
---
# - React Hooks
  React Hooks makes it easier for me to extract and reuse code while maintaining a consistant use of functional components.
# - JWT Tokens and Bcrypt
  Utilize stateless tokens to maintain a local and client side based authentication. This imporoves the user experience as the user as refresh does not have to occur everytime authentication or authorization is required. Also helps improve scalability by using less server side resources. 
# - Postgresql
  Postgresql is a program that allows me to easily create a relational database and view my data in clear and distinct tables.
# - React Router
  React Router made redirects seamless for me, allowing redirects to pages without having to refresh the browser.
# - Rails API
  Using a Rails API gave me the ability to create an API only backend, so I could manipulate a virtual browser with React to decrease resource strain on the server.
# - Active Model Serializer
  Active Model Serializer made it easier for me to manipulate and extract data related to users, limiting the amount of code written on the frontend.
# - Cloudinary
  Cloudinary lessened the strain on my server. Instead of storing images on a local source, Cloudinary allowed me to store them in the cloud and retreive them when necessary.
# - Material UI
  Material UI was built for React. It has a large and fully customizable components. The main reason I used Material UI was because of the time constraint for this project. The large amount of ready out of the box components made design much quicker while still looking professional and feeling dynamic.
# - Edamam API
  Edamam API has one of the largest databases for recipes. It contains tons of information related to nutrition and allowed making a search component straightforward.

# Features
---
- Create an account 
- Search through database powered by Edamam API and user submissions to find recipes
- Post Recipes
- Upload images to your profile and to a post
- Search for users and recipes by name
- Follow users
- Comment and reply on posts and comments
- View Feed of followed user submissions
- View your explore page to discover new recipes and new users

# Contributing
---
Contributions are welcome, submit a pull request!

# Author
---
Trevor Low -[Github](https://github.com/tklow94?tab=repositories)

# License 
---
This project is licensed under the [GNU GPL](https://www.gnu.org/licenses/gpl-3.0.en.html)


