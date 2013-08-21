require "gitlab"

module Magnum::Integration
  class Gitlab < Base
    def initialize(private_token)
      @private_token = private_token
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

    private

    def client
      @client ||= ::Gitlab::Client.new(
        endpoint: "https://gitlab.com/api/v3",
        private_token: @private_token
      )
    end

    def init_repository(repo)
      Magnum::Integration::Repository.new(
        id:          repo.id,
        name:        repo.name,
        description: repo.description,
        source_url:  repo.ssh_url_to_repo,
        private:     !repo.public
      )
    end
  end
end