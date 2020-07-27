require 'open-uri'
require 'net/http' # 2nd st of methods
require 'json' #4 set of methods 


# url = "https://learn-co-curriculum.github.io/json-site-example/"
# uri = URI.parse(url)
# uri.open
# # request_result = uri.open
# # request_result.string
# uri.open.string

# #2nd method of getting data/ parching 
# url = "https://learn-co-curriculum.github.io/json-site-example/"
# uri = URI.parse(url)
# response = Net::HTTP.get_response(uri)
# response.body

# #using jason and parsing data// same method as #2 and yeilding different difference
# url = "https://learn-co-curriculum.github.io/json-site-example/endpoints/locations.json"
# uri = URI.parse(url)
# response = Net::HTTP.get_response(uri)
# response.body

#4th set of methods 
# url = "https://learn-co-curriculum.github.io/json-site-example/endpoints/locations.json"
# uri = URI.parse(url)
# response = Net::HTTP.get_response(uri)
# response.body
# school_hash=JSON.parse(response.body)

class GetPrograms
 
    URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"
   
    def get_programs
      uri = URI.parse(URL)
      response = Net::HTTP.get_response(uri)
      response.body
    end

    def program_school
        # we use the JSON library to parse the API response into nicely formatted JSON
          programs = JSON.parse(self.get_programs)
          programs.collect do |program|
            program["agency"]  
          end
    end

end

#   programs = GetPrograms.new.get_programs
#   puts programs

programs = GetPrograms.new
puts programs.program_school.uniq

