module Vindicia
  class Request
    include HTTParty
    format :json
    base_uri 'https://api.vindicia.com'

    def initialize(method, path, options = {})
      @method  = method
      @path    = path
      @options = options
    end

    def response
      Hashie::Mash.new(self.class.send(@method, @path, @options.merge(default_options)))
    end

    private

    def default_options
      { basic_auth: { username: Vindicia.username, password: Vindicia.password }}
    end
  end
end
