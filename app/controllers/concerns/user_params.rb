module UserParams
  private

  def user_params
    params.permit(
      :email,
      :first_name,
      :infix,
      :last_name,
      :city,
      :gender,
      :birth_date,
      :password,
      :password_confirmation
    )
  end
end
