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
```

## Testing

Execute test suite:

```
rake test
```