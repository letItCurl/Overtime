module ApplicationHelper
    
    def admin_types
        ["AdminUser"]
    end
    
    def active?(path)
        "active" if current_page?(path)
    end

    def status_label status
        tag = {
        "approved" => content_tag(:span, status, class: "label label-success"),
        "submitted" => content_tag(:span, status, class: "label label-primary"),
        "rejected" => content_tag(:span, status, class: "label label-danger"),
        "confirmed" => content_tag(:span, status, class: "label label-success"),
        "pending" => content_tag(:span, status, class: "label label-warning"),
        }
        tag[status]
    end
    
end
