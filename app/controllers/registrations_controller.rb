class RegistrationsController < Devise::RegistrationsController
  before_filter :destroy_user, only: [ :destroy ]
  before_filter :create_user, only: [ :create ]

  # ユーザ作成
  def create_user
  end

  # アカウント削除
  def destroy_user
    logger.info "-------- destroy_user_info ----------"
    User.transaction do
      id = current_user.id
    end
  end

end
