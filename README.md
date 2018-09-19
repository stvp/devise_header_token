Archived
--------

This project has not been maintained for several years; its use is not recommended.


devise_header_token
===================

Patches in support for token authentication via headers rather than basic auth or request params for Devise's `token_authenticatable` strategy.

This is without tests.


Usage
-----

In your Gemfile:

```ruby
gem 'devise'
gem 'devise_header_token'
```

In your `config/initializers/devise.rb`, set the header key:

```ruby
config.token_authentication_key = 'X-API-TOKEN'
```

And it all should Just Work™.

