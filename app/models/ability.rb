alias_action :create, :read, :update, :delete, to: :crud

can :crud, Lesson do |lesson|
    user == Lesson.user
end

can :crud, Review do |review|
    user == Review.user
end

can :destroy, :Review do |review|
    user == Review.user
end