module PostsHelper
    def status_label status
        tag = {
        "approved" => content_tag(:span, status, class: "label label-success"),
        "submitted" => content_tag(:span, status, class: "label label-primary"),
        "rejected" => content_tag(:span, status, class: "label label-danger"),
        }
        tag[status]
    end
end


