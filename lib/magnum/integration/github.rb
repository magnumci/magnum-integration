require "octokit"

module Magnum::Integration
  class Github < Base
    def initialize(oauth_token)
      @oauth_token = oauth_token
    end

    def repositories
      resp = client.repositories(nil, sort: "pushed", direction: "desc")
      resp.map { |r| format_repository(r) }
    end

    def repository(id)
      format_repository(client.repository(id))
    end

    def deploy_keys(repo)
      client.deploy_keys(repo)
    end

    def add_deploy_key(repo, title, key)
      client.add_deploy_key(repo, title, key)
    end

    def remove_deploy_key(repo, key)
      client.remove_deploy_key(repo, key)
    end

    private

    def client
      @client ||= Octokit::Client.new(login: "me", oauth_token: @oauth_token)
    end

    def format_repository(repo)
      {
        id:          repo.id,
        name:        repo.name,
        description: repo.description,
        source_url:  repo.ssh_url,
        private:     repo.private
      }
    end
  end
end