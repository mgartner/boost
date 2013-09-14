class AppController < UIViewController

  BG_COLOR = "#111222".to_color
  #GLOW_COLORS = ["#26CAE7", "#4DA3D0", "#747CBA", "#9C55A4", "#C32E8E", "#EB0778"].map(&:to_color)
  GLOW_COLORS = ["#26CAE7", "#22E7BD", "#1FE774", "#1CE828", "#59E819", "#E9E113"].map(&:to_color)

  def viewDidLoad
    super

    # Set the tracking view name.
    self.title = "BOOST"

    self.view.backgroundColor = BG_COLOR

    @label = UILabel.alloc.initWithFrame(CGRectMake(50, 50, 100, 30))
    @label.backgroundColor = UIColor.clearColor
    @label.textColor = UIColor.whiteColor
    self.view.addSubview @label

    @circle_slider = TBCircularSlider.alloc.initWithFrame(CGRectMake(0, 200, 250, 250))
    @circle_slider.addTarget(self, action: "slider_action:", forControlEvents: UIControlEventValueChanged)
    self.view.addSubview @circle_slider

    # Show a sign up view if there is no user
    if App.delegate.user.nil?
      show_sign_up_modal_view(true)
    end

  end

  def slider_action(slider)
    puts slider.angle
    puts slider.value
    @label.text = "#{(slider.angle * slider.angle) / 1296.0}"
  end

  def viewWillAppear(animated)
    super
  end

  def viewWillDisappear(animated)
    super
  end

end

