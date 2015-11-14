class UserPrivaciesController < ApplicationController

  def setPrivacy
    #static for now

      @privacy = UserPrivacy.new(user_privacy_params)
      if(!@privacy.save)
      flash[:notice] = @privacy.errors.messages
    end
    redirect_to :back

  end

  private

  def user_privacy_params
    params.require(:userPrivacy).permit(:activity_id, :user_id, :privacy_id)

   end
end
