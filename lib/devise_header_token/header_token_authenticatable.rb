module Devise
  module Strategies
    class HeaderTokenAuthenticatable < TokenAuthenticatable
      # Devise accomplishes all the work of authentication through side-effects.
      # What you see below is a much, much simpler version of how Devise's
      # strategies normally work.
      def valid?
        self.authentication_hash = {}
        self.authentication_type = :token_auth
        if token = header_values[header_key]
          self.authentication_hash[mapping.to.token_authentication_key] = token
        else
          false
        end
      end

      private

      def header_key
        "HTTP_#{mapping.to.token_authentication_key.gsub('-', '_').upcase}"
      end

      def header_values
        env.select { |k, v| k =~ /^HTTP_/ }
      end
    end
  end
end

# Overwrite the heathen basic auth / params token strategy with our kickin'-rad
# headers-only strategy.
Warden::Strategies.add(:token_authenticatable, Devise::Strategies::HeaderTokenAuthenticatable)
