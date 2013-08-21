require "gitlab"
require "magnum/integration/ext/gitlab"

module Magnum::Integration
  class Gitlab < Base
    def initialize(private_token, endpoint=nil)
      @private_token = private_token
      @endpoint ||= "https://gitlab.com/api/v3"
    end

    def repositories
      client.projects.map { |r| init_repository(r) }
    end

    def repository(id)
      init_repository(client.project(id))
    end

    def hooks(repo)
      client.project_hooks(repo)
    end

    def create_hook(repo, url)
      client.add_project_hook(repo, url)
    end

    def delete_hook(repo, id)
      client.delete_project_hook(repo, id)
    end

    def deploy_keys(repo)
      client.deploy_keys(repo)
    end

    def deploy_key(repo, id)
      client.deploy_key(repo, id)
    end

    def create_deploy_key(repo, title, key)
      client.create_deploy_key(repo, title, key)
    end

    def delete_deploy_key(repo, id)
      client.delete_deploy_key(repo, id)
    end

    private

    def client
      @client ||= ::Gitlab::Client.new(
        endpoint: @endpoint,
        private_token: @private_token
      )
    end

    def init_repository(repo)
      Magnum::Integration::Repository.new(
        id:          repo.id,
        name:        repo.name,
        description: repo.description,
        source_url:  repo.ssh_url_to_repo,
        source_type: "git",
        private:     !repo.public
      )
    end
  end
end