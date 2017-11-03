require 'Zones'

class Station


 attr_reader :name, :zone

 def initialize(name)
   @name = name
   @zone = self.fetch_zone(name)
 end

def fetch_zone(name)
   Zones.const_get(name.to_s.upcase)
end


end
