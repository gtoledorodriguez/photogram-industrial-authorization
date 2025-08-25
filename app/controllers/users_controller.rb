class UsersController < ApplicationController
  before_action :set_user, only: %i[ show liked feed discover ]
  before_action :authorize_feed_and_discover_access, only: [:feed, :discover]

  def index
    @users = @q.result
  end

  private

    def set_user
      if params[:username]
        @user = User.find_by!(username: params.fetch(:username))
      else
        @user = current_user
      end
    end

    def authorize_feed_and_discover_access
    if current_user != @user
      redirect_back fallback_location: root_url, alert: "You're not authorized for that."
    end
  end
end
