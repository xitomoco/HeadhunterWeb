class UserPolicy < ApplicationPolicy

  def user_headhunter?
    user.headhunter?
  end

  def user_candidate?
    user.candidate?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
