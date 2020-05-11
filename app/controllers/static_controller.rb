class StaticController < ApplicationController
  def homepage

    if admin_types.include?(current_user.type)
      @pending_approvals = Post.submitted.first(12)
      @recent_audit_items = AuditLog.first(12)
    else
      @pending_audit_confirmations = current_user.audit_logs.pending.first(5)
    end
  end
end
