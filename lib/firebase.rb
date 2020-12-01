# frozen_string_literal: true

class Firebase
  class << self
    def request(uid)
      HTTParty.post(url, headers: {
                      'Content-Type' => 'application/json'
                    },
                         body: { idToken: uid }.to_json)
    end

    private

    def url
      "#{firebase_url}?key=#{api_key}"
    end

    def firebase_url
      ENV['FIREBASE_VERIFY_URL']
    end

    def api_key
      ENV['FIREBASE_API_KEY']
    end
  end
end
