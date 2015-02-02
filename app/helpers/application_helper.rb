module ApplicationHelper
    def form_group_tag(errors, &block)
        if errors.any?
            content_tag :div, capture(&block), class: 'form-group has-error'
        else
            content_tag :div, capture(&block), class: 'form-group'
        end
    end
    
    def form_class_tag(errors)
        if errors.any?
            "form-group"
        else
            "form-group has-error"
        end
    end
    
end
