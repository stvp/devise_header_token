module Devise
  module Strategies
    class HeaderTokenAuthenticatable < TokenAuthenticatable
      def with_authentication_hash(*args)
        super && parse_authentication_key_values(header_values, header_keys)
      end

      private

      # Skip basic auth authentication.
      def authentication_keys
        []
      end

      # Skip params authentication.
      def request_keys
        []
      end

      def header_keys
        @header_keys ||= ["HTTP_#{mapping.to.token_authentication_key.gsub('-', '_').upcase}"]
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
