require "octokit"

module Magnum::Integration
  class Github < Base
    def initialize(oauth_token)
      @oauth_token = oauth_token
    end

    def repositories
      client.repositories.map { |r| format_repository(r) }
    end

    def repository(id)
      format_repository(client.repository(id))
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
        source_url:  repo.ssh_url
      }
    end
  end
end