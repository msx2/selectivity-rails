# Selectivity.js for Rails' Asset Pipeline

[Selectivity.js](https://github.com/arendjr/selectivity) is a modular and light-weight selection library for jQuery and Zepto.js.

## Installation and usage

Add `selectivity-rails` to Gemfile of your Rails application and run `bundle install`:

```
gem 'selectivity-rails'
```

### JavaScript
Add the following to your JavaScript manifest, by default `app/assets/javascripts/application.js`:

```javascript
//= require selectivity
```

### Stylesheets
Add the following to your stylesheet manifest, by default `app/assets/stylesheets/application.sass`:

```sass
@import 'selectivity'
```

If you use `application.css` default format, you might not be able to access mixins or variables. Use `.scss` or `.sass` syntax instead.

#### Customization
Selectivity.js is written in Sass and allows basic customization. For the list of all supported variables refer to [selectivity/variables.sass](https://github.com/msx2/selectivity-rails/blob/master/vendor/assets/stylesheets/selectivity/variables.sass)

To use customization, import your `variables` file before `selectivity`:

```sass
@import 'variables'
@import 'selectivity'
```

## RSpec helper
TODO

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
