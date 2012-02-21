# Echonest gem

## Usage

Right now the gem supports two Echonest resources: Artist and Song

``` ruby
class Artist < ActiveResource::Base
	echonestify :artist
end
```

Now you can lookup an artist by id:

``` ruby
artist = Artist.find(123)
```

You can also search for artists:

``` ruby
artists = Artist.search("Non Phixion")
```

You can, for example chain methods. Here is how you can search for all 'Non Phixion' songs that have 90 BPM


``` ruby
artists = Artist.search("Non Phixion").bpm({:min => 90, :max => 100})
```

Or you can order the results

``` ruby
artists = Artist.search("Non Phixion").sort({:familiarity => :asc})
```