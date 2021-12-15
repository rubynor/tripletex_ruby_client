# This makes the swagger generated gem actually work
#
# Tripletex, TT, doesn't support basic auth wth username password
#
#   {"status":401,"code":3000,"message":"Unauthorized","link":"https://www.tripletex.no/tripletex-api-2-0/",
#    "developerMessage":"Authorization header has invalid username: oma+tripletex@rubynor.com. Should be a customer id or 0 for default. The expected format is base64encoded(<<companyId>>:<<sessionToken>>)",
#    "validationMessages":null,"requestId":"49e6e494-d834-461a-adbd-963ff8c2374d"}
#
#  We need to use the consumerToken and employeeToken we were given and fetch a token.
#
# NOTE: This token expires, we set it to last for a month. On reboot it will fetch new token, so hopefully your app code has more activity than that.
# If not, don't ask me to do it for you, open a PR with a fix. OSS FTW :)
#
module TripletexRubyClient
  class Configuration
    # see also attributes in configuration.rb
    attr_accessor :consumer_token
    attr_accessor :employee_token
    attr_accessor :token_expiration_time

    # override monkey patch
    def basic_auth_token
      'Basic ' + ["0:#{session_token}"].pack('m').delete("\r\n")
    end

    def session_token
      if @token_expires_on && @token_expires_on <= Date.today
        # puts "session token expired"
        @session_token = nil
      end

      # puts "fetching session token"
      @session_token ||= SessionTokenRequest.new(base_url: base_url, consumer_token: consumer_token, employee_token: employee_token, expiration_date: set_token_expires_on).session_token
    end

    def set_token_expires_on
      @token_expiration_time ||= Rails.env.production? ? 1.month : 1.day
      @token_expires_on = @token_expiration_time.from_now.to_date
    end
  end
end
