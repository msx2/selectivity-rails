[![Gem Version](https://badge.fury.io/rb/selectivity-rails.svg)](http://badge.fury.io/rb/selectivity-rails)
[![Code Climate](https://codeclimate.com/github/msx2/selectivity-rails/badges/gpa.svg)](https://codeclimate.com/github/msx2/selectivity-rails)

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

#### Internationalization (i18n)
Selectivity.js uses English by default, however `selectivity-rails` supports multiple languages. Add the following to your JavaScript manifest, e.g. `app/assets/javascripts/application.js`:

```javascript
//= require selectivity.xx
```

where `xx` is the code of supported language. Currently supported are:

Code | Language
--- | ---
`pl_PL` | Polish

I18n file should be included **after** default `selectivity` script.

### Stylesheets
Add the following to your stylesheet manifest, by default `app/assets/stylesheets/application.sass`:

```sass
@import 'selectivity'
```

If you use `application.css` default format, you might not be able to access mixins or variables. Use `.scss` or `.sass` syntax instead.

For the basic styling supporting [`simple_form`](https://github.com/plataformatec/simple_form) and [Bootstrap](http://getbootstrap.com), import also `selectivity_bootstrap` stylesheet:

```sass
@import 'selectivity'
@import 'selectivity_bootstrap'
```

#### Customization
Selectivity.js is written in Sass and allows basic customization. For the list of all supported variables refer to [selectivity/variables.sass](https://github.com/msx2/selectivity-rails/blob/master/vendor/assets/stylesheets/selectivity/variables.sass)

To use customization, import your `variables` file before `selectivity`:

```sass
@import 'variables'
@import 'selectivity'
```

#### Icons: Font Awesome
By default, Selectivity.js uses [Font Awesome](http://fortawesome.github.io/Font-Awesome) icons.

If you don't use Font Awesome, you can install [`font-awesome-rails`](https://github.com/bokmann/font-awesome-rails) gem, or manually override styling for following CSS classes:

```sass
.fa.fa-remove
.fa.fa-chevron-right
.fa.fa-sort-desc
```

## RSpec helpers
`selectivity-rails` provides RSpec feature helper methods that allow user to select or unselect elements from both single and multiple select elements. Add the following to your `spec/rails_helper.rb` (or `spec/spec_helper.rb`):

```ruby
require 'selectivity/rspec'
```

This automatically configures RSpec by adding:

```ruby
RSpec.configure do |config|
  config.include Selectivity::Rspec::FeatureHelpers, type: :feature, js: true
end
```

Configuration includes two additional methods for all `type: :feature, js: true` specs:

```ruby
selectivity_select(value, options = {})
selectivity_unselect(value, options = {})
```

Both methods require `from: '...'` inside `options` hash that is either CSS path or field's label (requires `for` attribute!).

### Example usage
To handle single select:

```ruby
selectivity_select('Netherlands', from: 'Your country')
selectivity_unselect('Netherlands', from: '#country')
selectivity_select('Poland', from: '#country')
```

To handle multiple select:

```ruby
selectivity_select('Netherlands', 'Russia', 'Spain', from: 'Countries list')
# or, by single value:
selectivity_select('Poland', from: '#countries')

selectivity_unselect('Russia', 'Spain', from: 'Countries list')
# or, by single value:
selectivity_unselect('Netherlands', from: '#countries')
```

## Demos and examples
For detailed information on Selectivity.js possibilities and behavior, visit:

* [**Sample Rails application**](https://github.com/msx2/selectivity-rails-sample-app)
* [Selectivity.js repository](https://github.com/arendjr/selectivity)
* [Selectibity.js gh-page](https://arendjr.github.io/selectivity)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
