class AppDelegate
  attr_accessor :user, :navigation_controller

  def initialize
    # Enable the Network Activity Indicator for AFMotion requests.
    AFNetworkActivityIndicatorManager.sharedManager.setEnabled(true)

    irate = IRate.sharedInstance
    irate.messageTitle = "Review Boost for Heroku"
    irate.message = "Please take a moment to rate Boost for Heroku. Your feedback is greatly appreciated."
    irate.rateButtonLabel = "Rate It Now"
    irate.remindButtonLabel = "Remind Me Later"
    irate.cancelButtonLabel = "No Thanks"
    irate.daysUntilPrompt = 3
    irate.usesUntilPrompt = 3
  end

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @user = Heroku::User.current
    self.customize_appearance
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @boost_controller = HomeController.alloc.initWithNibName(nil, bundle:nil)
    @navigation_controller = UINavigationController.alloc.initWithRootViewController(@boost_controller)
    @window.rootViewController = @navigation_controller
    @window.makeKeyAndVisible
    true
  end

  def customize_appearance
    UINavigationBar.appearance.barTintColor = "#00dd55".to_color
    UINavigationBar.appearance.setTitleTextAttributes({
      UITextAttributeFont => UIFont.fontWithName("HelveticaNeue-Medium", size: 18)
    })
  end

end
