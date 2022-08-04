class Ability
    include CanCan::Ability

    def initialize(user)
        user ||= User.new
    end

    alias_action :create, :read, :update, :delete, to: :crud

    can :crud, Lesson do |lesson|
        user == Lesson.user
    end
    
    can :crud, Review do |review|
        user == persisted? && review.user != user
    end
    
    # can :review, Review do |review|
    #     student.p
    # end
    
    can :destroy, :Review do |review|
        user == Review.user
    end
end

  end