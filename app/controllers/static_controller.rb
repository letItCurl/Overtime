class StaticController < ApplicationController
  def homepage
    @pending_approvals = Post.where(status: 'submitted').first(12)
    @recent_audit_items = AuditLog.first(12)
  end
end
