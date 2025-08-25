class CommentPolicy < ApplicationPolicy

attr_reader :current_user, :comment

  def initialize(current_user, comment)
    @current_user = current_user
    @comment = comment
  end

  def show?
    comment.author == current_user ||
      !comment.author.private? ||
      comment.author.followers.include?(current_user)
  end

  def new?
    true  
  end

  def edit?
    comment.author == current_user
  end

  def create?
    comment.author == current_user
  end

  def update?
    comment.author == current_user
  end

  def destroy?
    comment.author == current_user
  end

end
