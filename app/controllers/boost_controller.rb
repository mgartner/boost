class BoostController < UIViewController

  BG_COLOR = "#111222".to_color
  #GLOW_COLORS = ["#26CAE7", "#4DA3D0", "#747CBA", "#9C55A4", "#C32E8E", "#EB0778"].map(&:to_color)
  GLOW_COLORS = ["#26CAE7", "#22E7BD", "#1FE774", "#1CE828", "#59E819", "#E9E113"].map(&:to_color)

  def viewDidLoad
    super

    # Set the tracking view name.
    self.title = "BOOST"

    self.view.backgroundColor = BG_COLOR

    @slider = LARSBar.alloc.initWithFrame(CGRectMake(10, 100, 300, 27))
    @slider.setThumbImage(UIImage.imageNamed('thumb'), forState: UIControlStateNormal)
    @slider.maximumValue = 99
    @slider.minimumValue = 0
    @slider.leftChannelLevel = 1
    @slider.rightChannelLevel = 1
    @slider.glowColors = GLOW_COLORS
    @slider.activeColor = GLOW_COLORS.first
    @slider.addTarget(self, action: "slider_action:", forControlEvents: UIControlEventValueChanged)
    self.view.addSubview @slider

    @label = UILabel.alloc.initWithFrame(CGRectMake(50, 50, 100, 30))
    @label.backgroundColor = UIColor.clearColor
    @label.textColor = UIColor.whiteColor
    self.view.addSubview @label

    @circle = TBCircularSlider.alloc.initWithFrame(CGRectMake(0, 200, 250, 250))
    self.view.addSubview @circle

  end

  def slider_action(slider)
    @label.text = slider.value.round(0).to_s
  end

  def viewWillAppear(animated)
    super
  end

  def viewWillDisappear(animated)
    super
  end

end
