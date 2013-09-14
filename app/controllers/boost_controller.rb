class BoostController < UIViewController
  
  BG_COLOR = "#111222".to_color

  def viewDidLoad
    super

    # Set the tracking view name.
    self.title = "BOOST"

    self.view.backgroundColor = BG_COLOR

    # Show a sign up view if there is no user
    if App.delegate.user.nil?
      show_sign_in_controller(false)
    end

  end

  def viewWillAppear(animated)
    super
  end

  def viewWillDisappear(animated)
    super
  end

  def show_sign_in_controller(animated = true)
    sign_up_controller = SignInController.alloc.init
    sign_up_controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical
    self.presentModalViewController(sign_up_controller, animated: animated)
  end

end
