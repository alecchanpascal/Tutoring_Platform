class Ability
    include CanCan::Ability

    def initialize(user)
        user ||= User.new
        
        alias_action :create, :read, :update, :delete, to: :crud
        
        can :crud, Lesson do |lesson|
            user == lesson.user
        end
        
        can :delete, Review do |review|
            user == review.student
        end
    end
end
