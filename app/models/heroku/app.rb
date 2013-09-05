module Heroku
  class App

    PROPERTIES = [:id, :name]
    PROPERTIES.each do |prop|
      attr_accessor prop
    end

    def initialize(attributes = {})
      attributes.each do |key, value|
        self.send("#{key}=", value) if PROPERTIES.member? key.to_sym
      end
      self
    end

  end
end
