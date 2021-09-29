class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map do |audition|
            audition.actor
        end
    end

    def locations
        self.auditions.map do |audition|
            audition.location
        end
    end

    def lead
        (self.auditions.find_by(hired: true) != nil)? self.auditions.find_by(hired: true) : 'no actor has been hired for this role'
    end

    def understudy
        (self.auditions.filter{|audition| audition.hired == true}[1] == nil)? 'no actor has been hired for understudy for this role' : self.auditions.filter{|audition| audition.hired == true}[1]
    end
end