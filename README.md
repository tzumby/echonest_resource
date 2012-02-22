# Echonest gem

## Usage

Right now the gem supports two Echonest resources: Artist and Song

``` ruby
class Artist < ActiveResource::Base
	echonest_resource :artist
end
```

Now you can lookup an artist by id:

``` ruby
artist = Artist.find(123)
```

You can also search for artists:

``` ruby
artists = Artist.search("Macklemore")
```

You can, for example chain methods. Here is how you can search for all 'Non Phixion' songs that have 90 BPM


``` ruby
artists = Artist.search("Macklemore").bpm({:min => 90, :max => 100})
```

Or you can order the results

``` ruby
artists = Artist.search("Macklemore").sort({:familiarity => :asc})
```

## Associations

``` ruby
class Song < ActiveResource::Base
	echonest_resource :song
end
```

``` ruby
class Artist < ActiveResource::Base
	has_many :songs
	echonest_resource :artist
end
```

``` ruby
macklemore = Artist.find(123)
songs = macklemore.songs  # => [#<Song>, #<Song>]
songs.first.title # => "The first song"
```

All the attributes on the songs use the same name as the Echonest API (http://developer.echonest.com/docs/v4/song.html)

