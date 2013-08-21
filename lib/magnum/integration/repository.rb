module Magnum::Integration
  class Repository
    attr_reader :id, :name, :description, :private
    attr_reader :source_url, :source_type

    def initialize(options={})
      @id          = options[:id]
      @name        = options[:name]
      @description = options[:description]
      @source_url  = options[:source_url]
      @source_type = options[:source_type]
      @private     = options[:private]
    end
  end
end