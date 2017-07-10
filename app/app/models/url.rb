class Url < ApplicationRecord
    def idKey
        self.id.to_s(36)      
    end
    
end
