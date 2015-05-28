class RegistrationsController < Devise::RegistrationsController
  before_filter :destroy_user, only: [ :destroy ]

  # アカウント削除
  def destroy_user
    logger.info "-------- destroy_user_info ----------"
    User.transaction do
      id = current_user.id
    end
  end

end
