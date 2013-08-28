class AppDelegate

  def initialize
    #irate = IRate.sharedInstance
    #irate.messageTitle = "Rate Fanium"
    #irate.message = "Please take a moment to rate Fanium Fantasy Football. Thanks for playing!"
    #irate.rateButtonLabel = "Rate It Now"
    #irate.remindButtonLabel = "Remind Me Later"
    #irate.cancelButtonLabel = "No Thanks"
  end

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @boost_controller = BoostController.alloc.initWithNibName(nil, bundle:nil)
    @window.rootViewController = @boost_controller
    @window.makeKeyAndVisible

    true
  end
end
