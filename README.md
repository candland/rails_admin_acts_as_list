# RailsAdminActsAsList

Support [acts_at_list](https://github.com/brendon/acts_as_list) models in [Rails Admin](https://github.com/railsadminteam/rails_admin)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "rails_admin_acts_as_list", :git => "git://github.com/candland/rails_admin_acts_as_list.git"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install rails_admin_acts_as_list
```

Add the actions to Rails Admin

__config/initializers/rails_admin.rb

```ruby
RailsAdmin.config do |config|
  # ...
  config.actions do
    # ...
    move_to_top
    move_higher
    move_lower
    move_to_bottom
    # ...
  end
  # ...
end
```

## Contributing

1. Fork the repository.
1. Create a topic branch.
1. Implement your feature or bug fix.
1. Add, commit, and push your changes.
1. Submit a pull request.

## References

- [Issue 3133](https://github.com/railsadminteam/rails_admin/issues/3133)
- [Custom Action](https://github.com/railsadminteam/rails_admin/wiki/Custom-action)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
