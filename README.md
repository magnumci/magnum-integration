# magnum-integration

Unified integration with Github, Bitbucket, Gitlab.

Get repositories, manage deploy keys and web hooks. 

## Installation

Add this line to your application's Gemfile:

```
gem "magnum-integration"
```

And then execute:

```
bundle
```

Or install it yourself as:

```
gem install magnum-integration
```

## Overview

This library provides a unified way to manage repositories hooks and deploy keys.

Integration has the following methods:

- `repositories`
- `repository`
- `deploy_keys`
- `create_deploy_key`
- `delete_deploy_key`
- `hooks`
- `create_hook`
- `delete_hook`

## Usage

Github:

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

Gitlab:

```ruby
require "magnum/integration"

# Initialize client
api = Magnum::Integration::Gitlab.new("private_token", "https://gitlab.com")

# Repositories
api.repositories
api.repository(REPO_ID)

# Deploy keys
api.deploy_keys(REPO_ID)
api.create_deploy_key(REPO_ID, "Magnum CI", "key contents")
api.delete_deploy_key(REPO_ID, 1234)

# Hooks
api.hooks
api.create_hook(REPO_ID, "http://myurl.com/push")
api.delete_hook(REPO_ID, 1234)
```

## Testing

Execute test suite:

```
rake test
```

## License

The MIT License (MIT)

Copyright (c) 2013-2014 Dan Sosedoff, <dan.sosedoff@gmail.com>