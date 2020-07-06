# MTGDeckBuilder
Sinatra app for building MTG decks

## Install Instructions
Run `bundle install` to install the dependencies, then run `rake db:migrate` and `rake db:seed` to create the db tables and populate them with an `admin` user, as well as all the cards from Scryfall. This will take a while, as there are more than 50k cards in the collection.

Once the seed has finished, you can startup the server with `rackup`. The default password for the `admin` user is `password1234`. It is a good idea to change this when moving to production.

## Contributing
If you find an issue please use the issue tracker. If you would like to contribute please create a pull request. In both instances, provide a description of your request/changes.
