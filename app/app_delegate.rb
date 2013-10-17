class AppDelegate
  attr_accessor :user, :navigation_controller

  def initialize
    # Enable the Network Activity Indicator for AFMotion requests.
    AFNetworkActivityIndicatorManager.sharedManager.setEnabled(true)

    #irate = IRate.sharedInstance
    #irate.messageTitle = "Rate Fanium"
    #irate.message = "Please take a moment to rate Fanium Fantasy Football. Thanks for playing!"
    #irate.rateButtonLabel = "Rate It Now"
    #irate.remindButtonLabel = "Remind Me Later"
    #irate.cancelButtonLabel = "No Thanks"
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
      UITextAttributeFont => UIFont.fontWithName("HelveticaNeue-Light", size: 20)
    })
  end

end
