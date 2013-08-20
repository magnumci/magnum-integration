module Magnum::Integration
  class Base
    def repositories
      raise "Implementation required"
    end

    def repository(id)
      raise "Implementation required"
    end

    def deploy_keys(repository_id)
      raise "Implementation required"
    end

    def deploy_key(repository_id, id)
      raise "Implementation required"
    end
  end
end