
# Independent Blog 

>project with the objective to use all the Rails tools learnt up to now.
Members log in to the blog to post images and articles as well as like the articles. The most popular ones show up in the featured column. The most recent articles are listed first. 

Check out the blog at: [Independent Blog](https://independentblog.herokuapp.com/)

## Project Roadmap

- Postgres set up both in production (Heroku) and in development.
- Devise
- User & Post model associations
- Display author name and surname based on the post.id
- Bootstrap styling of navbar and dropdown menues
- Conditional links
- String of time for articles in show and index pages
- Index page to display abstract of the article, sanitize and truncate
- Pagination on the index page, limit to 5 article per page
- Time ago
- Tagging and tag cloud modified to display the most rated one with the intesity of color vs size
- Carrierwave gem to help display images on the index page
- Fog gem
- Image hosting with Amazon S3
- Figaro
- Voting 
- Glyphicons on the voting button
- Bootstrap styling of flash messages
- Apply flex to modify bootstrap navbar 
- Scaffold tips, form for submitting tips, prepopulate user info if the user is logged in
- Implement caching on acts_as_votable to create a section that lists 3 of the "most popular" rated articles
- Display total likes below images
- Social share button gem
- Bootstrap 4 styling of pagination gem
- Display tags associated with each article below
- Gem searchkick, elasticsearch, and add on SearchBox for deployment 
- Configure User strong params to accept user images with carrierwave uploader, display in a flex grid

## Installation

- clone the repo and navigate to the project directory
- `rails s` to run locally
- Open http://localhost:3000 to view it in the browser

## Authors

Eliza Khachatryan