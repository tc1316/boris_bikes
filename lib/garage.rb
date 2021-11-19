require_relative "./bike.rb"
require_relative "./ds.rb"
require_relative "./van.rb"

class Garage
    attr_reader :holding
    
    def initialize
        @holding = []
    end
    
end