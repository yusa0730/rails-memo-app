class ApplicationController < ActionController::Base
  # CSRF対策を無効にするには、app/controllers/application_controller.rbに以下のコードを追加します。
  # https://techracho.bpsinc.jp/hachi8833/2017_10_23/46891
  protect_from_forgery
end
