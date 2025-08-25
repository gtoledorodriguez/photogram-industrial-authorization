class FollowRequestPolicy < ApplicationPolicy

attr_reader :current_user, :follow_request

  def initialize(current_user, follow_request)
    @current_user = current_user
    @follow_request = follow_request
  end

  def show?
    follow_request.sender == current_user || follow_request.recipient == current_user
  end

  def new?
    true
  end

  def edit?
    follow_request.sender == current_user || follow_request.recipient == current_user
  end

  def create?
    follow_request.sender == current_user && follow_request.recipient != current_user
  end

  def update?
    follow_request.sender == current_user || follow_request.recipient == current_user
  end

  def destroy?
    follow_request.sender == current_user || follow_request.recipient == current_user 
  end

end
