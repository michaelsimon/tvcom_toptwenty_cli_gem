# TV.com Top Twenty TV Shows
This Ruby gem will allow you to display the current top 20 TV shows according to TV.com. Additionally, for each show you will be able to get additional information including channel and air times, recent episodes, and top billed cast.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tvcom_toptwenty'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tvcom_toptwenty

## Usage

The application can be run on its own through a Bash session. 

* From your terminal run "ruby bin/tvcom_toptwenty" (assuming you are in the gem direcory).
* You will be greeted with a listing of the top twenty shows. View more information on a show by entering its rank number into the prompt. 
* Subsequently, to view additional shows, enter in the next rank number. 
* If at any time you want to see the list of shows and corresponding rank numbers again, enter "list" at the prompt. 
* Once you have found a show to watch, type "exit" at the prompt to close the application. 
* Enjoy your show!    

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/michaelsimon/tvcom_toptwenty_cli_gem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Content Copyright

All show information is Copyright TV.com and CBS Interactive, Inc. and subject to their [Terms of Use](http://legalterms.cbsinteractive.com/terms-of-use).

