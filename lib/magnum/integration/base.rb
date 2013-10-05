module Magnum::Integration
  class Base
    attr_reader :client

    def repositories
      raise "Implementation required"
    end

    def repository(repo)
      raise "Implementation required"
    end

    def deploy_keys(repo)
      raise "Implementation required"
    end

    def create_deploy_key(repo, title, key)
      raise "Implementation required"
    end

    def delete_deploy_key(repo, key)
      raise "Implementation required"
    end

    def hooks
      raise "Implementation required"
    end

    def create_hook(repo, url)
      raise "Implementation required"
    end

    def delete_hook(repo, hook)
      raise "Implementation required"
    end

    def method_missing(name, *args)
      client.send(name, *args)
    end
  end
end