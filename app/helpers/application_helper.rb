module ApplicationHelper

  #fflashタイプをbootstrapのクラスに変換
  def bootstrap_class_for(flash_type)
    case flash_type
      when "success", :success
        "alert-success"
      when "error", :error
        "alert-danger"
      when "alert", :alert, "warning", :warning
        "alert-warning"
      when "notice", :notice, "info", :info
        "alert-info"
      else
        flash_type.to_s
    end
  end
end

module I18n
  def t(code, options = {})
    begin
      msg_code = code
      human_attribute = eval(msg_code)
      return super.translate(human_attribute, options)
      #return human_attribute
    rescue SyntaxError => ex
      loggler.error ex.inspect
      return ""
    end
  end
end
