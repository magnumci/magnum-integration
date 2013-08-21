# magnum-integration

Unified integration with Github, Bitbucket, Gitlab. 

Get repositories, create deploy keys.

## Installation

Add this line to your application's Gemfile:

```
gem "magnum-integration"
```

And then execute:

```
bundle
````

Or install it yourself as:

```
gem install magnum-integration
```

## Usage

Get list of repositories from Github:

```ruby
require "magnum/integration"

# Initialize client
api = Magnum::Integration::Github.new("oauth_token")

# Repositories
api.repositories
api.repository("username/repo")

# Deploy keys
api.deploy_keys("username/repo")
api.create_deploy_key("username/repo", "Magnum CI", "key contents")
api.delete_deploy_key("username/repo", 1234)

# Hooks
api.hooks
api.create_hook("username/repo", "http://myurl.com/push")
api.delete_hook("username/repo", 1234)
```

## Testing

Execute test suite:

```
rake test
```