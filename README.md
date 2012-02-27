# Echonest gem

## Installation

Add the gem to your Gemfile

``` ruby
gem "echonest_resource"
```

Obtain an API key from echonest and create a file called 'echonest.yml' in your /config directory

``` ruby
api_key = "YOUR_API_KEY"
```

## Usage

Right now the gem supports two Echonest resources: Artist and Song

### Artist

``` ruby
class Artist
	include EchonestResource::Base
	echonest_resource :artist
end
```

``` ruby
class Song
	include EchonestResource::Base
	echonest_resource :song
end
```

Now you can search for an artist:

``` ruby
artists = Artist.search("Macklemore")
```

The search method also accepts an options hash where you can specify things like: results, bucket, sort


``` ruby
artists = Artist.search("Macklemore", {:results => 20, :sort => "hotttnesss-desc"})
```

### Song

Just like with the Artist resource, you can search by a song title

``` ruby
song = Song.search("The Town")
```

You can search for songs by an artist name

``` ruby
songs = Song.find_by_artist_name("Macklemore")
```

The find_by_artist_name method also accepts an options hash 

``` ruby
songs = Song.find_by_artist_name("Macklemore", :sort => "song_hotttnesss")
```

You can retrieve additional information by specifying a bucket like so:

``` ruby
songs = Song.find_by_artist_name("Macklemore", :bucket => "audio_summary", :results => 20)
```


All the attributes on the songs use the same name as the Echonest API (http://developer.echonest.com/docs/v4)

