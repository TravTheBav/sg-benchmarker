module ApplicationHelper
    # fills in search fields with existing params on search submit
    def existing_input(key)
        params.has_key?(key) ? params[key] : nil
    end
end
