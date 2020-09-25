module PostsHelper
  def user_session_options
    if user_signed_in?
      link_to 'Logout', destroy_user_session_path, method: :delete
    else
      capture do
        concat link_to 'Login', new_user_session_path
        concat ' '
        concat content_tag(:br)
        concat link_to 'Sign Up', new_user_registration_path
      end
    end
  end

  def show_author_if_user_session
    if user_signed_in?
      content_tag(:span) do
        concat 'Author: '
        concat @user.fullname
        concat content_tag(:br)
      end
    end
  end
end
