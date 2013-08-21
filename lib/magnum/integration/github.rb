require "octokit"

module Magnum::Integration
  class Github < Base
    def initialize(oauth_token)
      @oauth_token = oauth_token
    end

    def repositories
      resp = client.repositories(nil, sort: "pushed", direction: "desc")
      resp.map { |r| init_repository(r) }
    end

    def repository(repo)
      init_repository(client.repository(repo))
    end

    def deploy_keys(repo)
      client.deploy_keys(repo)
    end

    def create_deploy_key(repo, title, key)
      client.add_deploy_key(repo, title, key)
    end

    def delete_deploy_key(repo, key)
      client.remove_deploy_key(repo, key)
    end

    def hooks(repo)
      client.hooks(repo)
    end

    def create_hook(repo, url)
      client.create_hook(repo, "web", url: url)
    end

    def delete_hook(repo, id)
      client.remove_hook(repo, id)
    end

    private

    def client
      @client ||= Octokit::Client.new(login: "me", oauth_token: @oauth_token)
    end

    def init_repository(repo)
      Magnum::Integration::Repository.new(
        id:          repo.id,
        name:        repo.name,
        description: repo.description,
        source_url:  repo.ssh_url,
        private:     repo.private
      )
    end
  end
end