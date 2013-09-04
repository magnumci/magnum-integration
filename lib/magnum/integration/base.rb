module Magnum::Integration
  class Base
    attr_reader :client

    def method_missing(name, *args)
      client.send(name, *args)
    end
  end
end