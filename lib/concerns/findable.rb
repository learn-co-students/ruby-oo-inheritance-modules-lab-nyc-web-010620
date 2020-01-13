module Findable 
    def find_by_name(name)
        self.all.find do |obj|
            obj.name == name 
        end 
    end
end 