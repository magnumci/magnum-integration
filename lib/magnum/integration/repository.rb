module Magnum::Integration
  class Repository
    attr_reader :id, :name, :description, :private
    attr_reader :url, :scm

    def initialize(options = {})
      @id          = options[:id]
      @name        = options[:name]
      @description = options[:description]
      @scm         = options[:scm]
      @url         = options[:url]
      @private     = options[:private] == true
    end

    def private?
      private == true
    end

    def git?
      scm == "git"
    end
  end
end