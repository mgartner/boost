module Heroku
  class User

    DOMAIN = "http://api.heroku.com/"

    PROPERTIES = [:api_key, :email]
    PROPERTIES.each do |prop|
      attr_accessor prop
    end

    def self.login(username, password, &block)
      opts = {
        headers: {
          Accept: 'application/json'
        },
        payload: {
          username: username,
          password: password
        }
      }

      BW::HTTP.post("https://api.heroku.com/login", opts) do |response|
        if response.ok?
          json = BW::JSON.parse(response.body.to_s)
          block.call(User.new(json))
        else
          block.call(nil)
        end
      end
    end

    def initialize(attributes = {})
      attributes.each do |key, value|
        self.send("#{key}=", value) if PROPERTIES.member? key.to_sym
      end
      self
    end

    def initWithCoder(decoder)
      self.init
      PROPERTIES.each do |prop|
        value = decoder.decodeObjectForKey(prop.to_s)
        self.send("#{prop}=", value) if value
      end
      self
    end

    def encodeWithCoder(encoder)
      PROPERTIES.each do |prop|
        encoder.encodeObject(self.send(prop.to_s), forKey: prop.to_s)
      end
    end

    def auth_options
      encoded_auth = [":#{@api_key}"].pack('m0')
      {
        headers: {
          Accept:         "application/json",
          Authorization:  "Basic #{encoded_auth}"
        }
      }
    end

    def apps(&block)
      BW::HTTP.get("https://api.heroku.com/apps", auth_options) do |response|
        if response.ok?
          apps = BW::JSON.parse(response.body.to_s)
          apps.map! { |app_json| Heroku::App.new(app_json) }
          block.call(apps)
        else
          block.call(nil)
        end
      end
    end

    def dynos(id, &block)
      BW::HTTP.get("https://api.heroku.com/apps/#{id}/formation", auth_options) do |response|
        if response.ok?
          dynos = BW::JSON.parse(response.body.to_s)
          puts dynos
          dynos.map! { |dyno_json| Heroku::Dyno.new(dyno_json) }
          puts dynos
          block.call(dynos)
        else
          block.call(nil)
        end
      end
    end

    def scale(id, type, quantity, &block)
      options = auth_options
      options[:payload] = {type: type, qty: quantity}
      BW::HTTP.post("https://api.heroku.com/apps/#{id}/ps/scale", options) do |response|
        puts response
        if response.ok?
          block.call(response.body)
        else
          block.call(nil)
        end
      end
    end

    # TODO: Experimental.
    def restart(id, &block)
      BW::HTTP.post("https://api.heroku.com/apps/#{id}/ps/restart", auth_options) do |response|
        if response.ok?
          block.call(response.body)
        else
          block.call(nil)
        end
      end
    end

  end
end
