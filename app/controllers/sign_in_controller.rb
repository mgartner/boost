class SignInController < UIViewController
  stylesheet :sign_in

  def viewDidLoad
    layout(self.view, :root) do
      @email_field = subview(UITextField, :email_field)
      @password_field = subview(UITextField, :password_field)
      @submit_button = subview(UIButton, :submit_button)
    end
    @password_field.delegate = self
    @submit_button.when(UIControlEventTouchUpInside) { login }
  end

  def login
    email = @email_field.text
    password = @password_field.text

    if email.nil? || email.empty? || password.nil? || password.empty?
      SVProgressHUD.showErrorWithStatus("Please enter Email and Password")
    else
      SVProgressHUD.showWithStatus("Signing In...", maskType: SVProgressHUDMaskTypeGradient)
      Heroku::User.login(email, password) do |user|
        if user
          App.delegate.user = user
          SVProgressHUD.dismiss
          self.dismissViewControllerAnimated(true, completion: nil)
        else
          SVProgressHUD.showErrorWithStatus("Invalid Email or Password")
        end
      end
    end
  end

  def textFieldShouldReturn(text_field)
    login
  end

end
