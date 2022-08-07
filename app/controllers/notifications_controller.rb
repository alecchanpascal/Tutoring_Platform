class NotificationsController < ApplicationController
    before_action :find_notification

    def destroy
        if @note.destroy
            redirect_back(fallback_location: root_path)
        else
            flash[:Error] = @note.errors.full_messages.to_sentence
            redirect_back(fallback_location: root_path)
        end
    end

    private

    def find_notification
        @note = Notification.find(params[:id])
    end
end
