# Life Invader

Life Invader (name from GTA V's parody social network) is a Facebook clone made in Ruby on Rails

Some of its features are:

- Sign up new users (Devise)
- Facebook sing up and log in (OAUTH)
- Send confirmation email (action required)
- Make new posts, allow images
- Make comments
- Update profile picture
- Send friend requests, accept and decline them
- Fully functional friends search
- Responsive design
- Tests
- Bullet optimized Active Record queries

The database is postgreSQL for development and production.

## Running the app locally:

postgreSQL is required, the easiest way is to run it through docker:

`docker run --name postgres-container -e POSTGRES_PASSWORD=password -d -p 5432:5432 postgres`

Using your PG user in Rails:

Set your pg username (by default postgres) in `config/database.yml`

Set your pg password (by default password) as ENV variable in `config/application.yml` (you will need to create that file, used by Figaro).

`PG_PASSWORD: password`

Setting up the Rails app:
```
bundle install
rails db:create
rails db:migrate
rails db:seed
rails server
http://localhost:3000/ in your web browser
```

The seeds include 3 users but they must be confirmed first, either from the links in the emails from letter_opener that will pop up in your browser after `db:seed` or from the Rails console:

```
rails console
User.first.confirm
exit
```

- email1@example.com
  PW: 123456

- email2@example.com
  PW: 123456

- email3@example.com
  PW: 123456

  ## Tests

  To run the tests `rails test`
