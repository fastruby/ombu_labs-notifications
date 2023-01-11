# OmbuLabs::Notifications
Source code for OmbuLabs notifications. 

## Usage
This gem can be used in any of our sites to send email and slack notifications. The aim of this gem is to simplify things when we need to update some code when something is broken in all of our sites. 

There are some ENV variables in this gem that will need to be defined in any new site. 
You will also need to include a Contact model that had the following:
email, email_sent_at, slack_notified_at, and id. You will also need an update_column method. 

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'ombu_labs-notifications'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install ombu_labs-notifications
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
