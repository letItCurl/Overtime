class PostPolicy < ApplicationPolicy
    def update?
        return true if record.approved? && admin_types.include?(@user.type)
        return true if ( @record.user_id == @user.id || admin_types.include?(@user.type) ) && !record.approved?
    end
    def approve?
        admin?
    end
    private
    def admin?
        admin_types.include?(user.type)
    end
end