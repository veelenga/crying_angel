# CryingAngel [![Build Status](https://api.travis-ci.org/veelenga/crying_angel.svg?branch=master)](https://travis-ci.org/veelenga/crying_angel) [![Code Climate](https://codeclimate.com/github/veelenga/crying_angel/badges/gpa.svg)](https://codeclimate.com/github/veelenga/crying_angel) [![Test Coverage](https://codeclimate.com/github/veelenga/crying_angel/badges/coverage.svg)](https://codeclimate.com/github/veelenga/crying_angel/coverage) [![Inline docs](http://inch-ci.org/github/veelenga/crying_angel.svg?branch=master)](http://inch-ci.org/github/veelenga/crying_angel)

My solution for "crying angel" problem.

## Installation

Clone a repository and execute the following sequence of commands:

```ruby
bundle install
bundle exec rspec
gem build crying_angel.gemspec
gem install cyring_angel-0.0.1.gem
```

## Usage

```ruby
require 'crying_angel'

ol = Location.new(0, 10)   # Olenka's location
il = Location.new(301, 10) # Ivanko's location
al = Location.new(0, 0)    # Angel's location

p angel_cries?(ol, il, al) # => true
```

Go to [specs](spec/crying_angel_spec.rb) to find more examples. Here is how it looks with formatted documentation option:

```ruby
#angel_cries?
  angel can not see Olenka but can see Ivanko
    returns false
  angel can not see Ivanko but can see Olenka
    returns false
  angel can not see both
    returns false
  angel can see both
    returns false if distance between Ivanko and Olenka <= 300 km
    returns true if distance between Ivanko and Olenka > 300 km
```

## Documentation

Full docs you can find [here](http://www.rubydoc.info/github/veelenga/crying_angel).

## Contributing

1. Fork it ( https://github.com/veelenga/crying_angel/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
