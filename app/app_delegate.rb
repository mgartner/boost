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
    UINavigationBar.appearance.barTintColor = "#00ffcc".to_color
=begin
    // Navigation bar appearance (background ant title)

[[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor titleColor], NSForegroundColorAttributeName, [UIFont fontWithName:@"FontNAme" size:titleSize], NSFontAttributeName, nil]];

[[UINavigationBar appearance] setTintColor:[UIColor barColor]];

// Navigation bar buttons appearance

[[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor textBarColor], NSForegroundColorAttributeName, shadowColor, NSShadowAttributeName, [UIFont fontWithName:@"FontName" size:titleSize], NSFontAttributeName, nil];
=end
  end

end
