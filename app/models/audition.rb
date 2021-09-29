class Audition < ActiveRecord::Base
    belongs_to :roles

    def role
        self.role_id
    end #Audition.first.role

    def call_back
        self.update(hired: !hired)
    end
end