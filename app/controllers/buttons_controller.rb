class ButtonsController < ApplicationController
    def show
        @button = Button.find(1) #Button.find(id: 1)
    end

    def index
        @buttons = Button.all
    end

    def doit
        @button = Button.find(1)
        @newcount = @button.clicks + 1
        Button.find(1).update_attributes(:clicks => @newcount)
    end
end
