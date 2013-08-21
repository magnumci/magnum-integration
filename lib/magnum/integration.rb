require "magnum/integration/version"

module Magnum
  module Integration
    autoload :Repository, "magnum/integration/repository"
    autoload :Base,       "magnum/integration/base"
    autoload :Github,     "magnum/integration/github"
    autoload :Bitbucket,  "magnum/integration/bitbucket"
    autoload :Gitlab,     "magnum/integration/gitlab"
  end
end
