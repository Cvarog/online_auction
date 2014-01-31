module Features
  module SessionsHelpers
    def sign_in_with(email, password)
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_on "Sign in"
    end

    def admin_session
      FactoryGirl.create(:user, email: "uchihamilord@gmail.com", admin: true)
      visit new_user_session_path
      sign_in_with "uchihamilord@gmail.com", '12345678'
    end
  end
end