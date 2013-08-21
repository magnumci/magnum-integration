module Magnum::Integration
  class Repository
    attr_reader :id, :name, :description
    attr_reader :source_url, :private

    def initialize(options={})
      @id          = options[:id]
      @name        = options[:name]
      @description = options[:description]
      @source_url  = options[:source_url]
      @private     = options[:private]
    end
  end
end