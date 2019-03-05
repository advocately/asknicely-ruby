# Asknicely API Ruby Client

Unofficial Ruby client for the [Asknicely API](https://asknicely.asknice.ly/help/apidocs/responses).

## Installation

Add `gem 'asknicely'` to your application's Gemfile, and then run `bundle` to install.

## Configuration

To get started, you need to configure the client with your secret API key. If you're using Rails, you should add the following to new initializer file in `config/initializers/asknicely.rb`.

```ruby
require 'asknicely'
Asknicely.api_key = 'YOUR_API_KEY'
Asknicely.api_base_url = 'https://YOUR_SUBDOMAIN.asknice.ly/api/v1'
```

For further options, read the [advanced configuration section](#advanced-configuration).

**Note:** Your API key is secret, and you should treat it like a password. You can find your API key in your Asknicely account, under *Settings* > *Integrations* > *API Keys*.


Retrieving a survey response:

```ruby
# Retrieve an existing survey response
survey_response3 = Asknicely::SurveyResponse.retrieve('123')
```

Listing survey responses:

```ruby
# List all survey responses
survey_responses = Asknicely::SurveyResponse.all({
  since_date: 1262304000,
  page: 3,
  per_page: 50
})
```

## <a name="advanced-configuration"></a> Advanced configuration & testing

The following options are configurable for the client:

```ruby
Asknicely.api_key
Asknicely.api_base_url
Asknicely.http_adapter # default: Asknicely::HTTPAdapter.new
```

By default, a shared instance of `Asknicely::Client` is created lazily in `Asknicely.shared_client`. If you want to create your own client, perhaps for test or if you have multiple API keys, you can:

```ruby
# Create an custom client instance, and pass as last argument to resource actions
client = Asknicely::Client.new(:api_key => 'API_KEY',
  :api_base_url => 'https://demo.asknice.ly/api/v1',
  :http_adapter => Asknicely::HTTPAdapter.new)
metrics_from_custom_client = Asknicely::SurveyResponse.retrieve({}, client)

# Or, you can set Asknicely.shared_client yourself
Asknicely.shared_client = Asknicely::Client.new(:api_key => 'API_KEY',
  :api_base_url => 'https://demo.asknice.ly/api/v1',
  :http_adapter => Asknicely::HTTPAdapter.new)
metrics_from_custom_shared_client = Asknicely::SurveyResponse.retrieve
```

## Supported runtimes

- Ruby MRI (1.8.7+)
- JRuby (1.8 + 1.9 modes)
- RBX (2.1.1)
- REE (1.8.7-2012.02)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Run the tests (`rake test`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
