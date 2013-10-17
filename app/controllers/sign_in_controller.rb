class SignInController < UIViewController

  def viewDidLoad
    self.view.backgroundColor = UIColor.whiteColor

    @desc = UILabel.alloc.initWithFrame(CGRectMake(10, 50, 300, 48))
    @desc.font = UIFont.fontWithName("HelveticaNeue-Light", size: 20)
    @desc.textAlignment = UITextAlignmentCenter
    @desc.text = "Sign-in using your Heroku email and password."
    @desc.numberOfLines = 2
    self.view.addSubview @desc

    @email_back = UIView.alloc.initWithFrame(CGRectMake(20, 150, 280, 40))
    @email_back.backgroundColor = "#EEE".to_color
    self.view.addSubview @email_back

    @password_back = UIView.alloc.initWithFrame(CGRectMake(20, 200, 280, 40))
    @password_back.backgroundColor = "#EEE".to_color
    self.view.addSubview @password_back

    @email_field = UITextField.alloc.initWithFrame(CGRectMake(30, 150, 260, 40))
    @email_field.placeholder = "Email"
    @email_field.font = UIFont.fontWithName("HelveticaNeue-Light", size: 20)
    @email_field.keyboardType = UIKeyboardTypeEmailAddress
    @email_field.autocapitalizationType = UITextAutocapitalizationTypeNone
    @email_field.autocorrectionType = UITextAutocorrectionTypeNo
    self.view.addSubview @email_field

    @password_field = UITextField.alloc.initWithFrame(CGRectMake(30, 200, 260, 40))
    @password_field.placeholder = "Password"
    @password_field.font = UIFont.fontWithName("HelveticaNeue-Light", size: 20)
    @password_field.backgroundColor = "#EEE".to_color
    @password_field.secureTextEntry = true
    @password_field.returnKeyType = UIReturnKeyGo
    @password_field.delegate = self
    self.view.addSubview @password_field

    @submit = UIButton.buttonWithType(UIButtonTypeSystem)
    @submit.frame = CGRectMake(110, 250, 100, 40)
    @submit.setTitle("Sign In", forState: UIControlStateNormal)
    @submit.setTitleColor("#007AFF".to_color, forState: UIControlStateNormal)
    @submit.titleLabel.setFont(UIFont.fontWithName("HelveticaNeue-Light", size: 20))
    @submit.when(UIControlEventTouchUpInside) { login }
    self.view.addSubview @submit

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
