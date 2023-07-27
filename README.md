# sinatra-template

Use this repository to create new Sinatra apps. 

Optionally, to use `ActiveRecord` for database operations, add to the `app.rb`:

```ruby
require "sinatra/activerecord"
```

And in the `config/environment.rb` file add this code block:

```ruby
configure do
  # setup a database connection
  set(:database, { adapter: "sqlite3", database: "db/development.sqlite3" })
end
```

## chartkick

ref. https://github.com/rogerwelin/sinatra-chartkick-example/tree/master

- In the gemfile:
```
gem "chartkick"
```
- Bundle it: 
```
bundle
```
- At the top of `app.rb`:
```
require 'chartkick'
```
- Put `chartkick.js` in the `public` directory

- Prepare an `data` in the view erb or `@data` array in the route file
`data` or `@data` can be named anything, and either a hash or an array
 - if you choose hash, then keys are the x-axis numbers and the hash values are the y-axis numbers.
 - if you choose array, then....

- In the erb view, include Google's Javascript adapter, and the `chartkick.js` file
```
<script src="https://www.google.com/jsapi"></script>
<script src="chartkick.js"></script>
```
## service object: nasa.rb
- create a folder named `services`
- create an rb file, for this app I chose `nasa.rb`
