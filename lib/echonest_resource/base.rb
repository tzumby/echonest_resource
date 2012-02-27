module EchonestResource
  module Base
  
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      
      def request_params
        {
          :api_key  => EchonestResource.api_key,
          :results  => 1
        }
      end
      
      def echonest_resource(resource)
        raise StandardError if resource.blank?

        include HTTParty
        base_uri 'http://developer.echonest.com/api/v4'
        format :json 
        
        case resource
        when :artist
          instance_eval <<-EOV
            def search(name, options={})
              raise StandardError if name.blank?

              results = Hashie::Mash.new(self.get('/artist/search', :query => 
                request_params.merge({:name => name}).merge(options)
              ))
              if results.response && results.response.artists; results.response.artists; end;
            end
          EOV
        when :song
          instance_eval <<-EOV
          
            def find_by_artist_id(id, options={})
              raise StandardError if id.blank?
          
              results = Hashie::Mash.new(self.get('/song/search', :query =>
                request_params.merge(options).merge({
                  :artist_id => id
                })
              ))
              if results.response && results.response.songs; results.response.songs; end;
            end
            
            def find_by_artist_name(name, options={})
              raise StandardError if name.blank?
              
              if artist = Artist.search(:name => name)
                Song.find_by_id(artist.first.id, options)
              end
            end
            
            def search(title, options={})
              raise StandardError if title.blank?
              
              results = Hashie::Mash.new(self.get('/song/search', :query => 
                request_params.merge({:title => title}).merge(options)
              ))
              results
            end
            
            
          EOV
        end
              
      end  
    end
    
  end
end