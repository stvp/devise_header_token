module Devise
  module Models
    # This is an awful way to load our code, but Devise defers loading its
    # "strategies" until `devise` is called and provides no way to hook into
    # that. So we're left with this.
    alias_method :__original_devise, :devise
    def devise(*modules)
      __original_devise(*modules)
      require 'devise_header_token/header_token_authenticatable'
    end
  end
end
