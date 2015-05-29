class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # 辞書ファイル（.ymlファイル）の中でrubyコードを使えるようにする
  #
  #   ** I18nのtransate(t)メソッドをオーバライド **
  #
  def I18n.t(code, options = {})
    begin
      message_code = code
      normal_translated = super message_code, options
      translated = eval("\"#{normal_translated}\"")
      return translated
    rescue SyntaxError => ex
      return normal_translated
    end
  end
end
