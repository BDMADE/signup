# Signup
It is a simple but very powerful authentication and authorization plug-ins for rails.

## Installation
**Step 1:** Add this line to your application's Gemfile:

```ruby
gem 'signup'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install signup
```

Follow the step to install this plugins:

**Step 2:**
For installing signup migration:

```
rake signup:install
```

**Step 3:**
Mount route, open config-> routes.rb and write below code:

```
mount Signup::Engine, at: '/'
```
**Step 4:**
Add style sheet in app->assets->stylesheets->application.css

```
*= require signup
```

## Usage
From your controller, just use:

```
before_action :authorized?
```

This will prevent guest user to enter in your view.

## Administrator
Username: admin@signup.com

Password: secret

## Contributing
If you find any issue, please inform us in our [github project repo](https://github.com/bdmade/signup)

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
