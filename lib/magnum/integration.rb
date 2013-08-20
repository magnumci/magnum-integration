require "magnum/integration/version"

module Magnum
  module Integration
    autoload :Base,      "magnum/integration/base"
    autoload :Github,    "magnum/integration/github"
    autoload :Bitbucket, "magnum/integration/bitbucket"
    autoload :Gitlab,    "magnum/integration/gitlab"
    autoload :Beanstalk, "magnum/integration/beanstalk"
  end
end
