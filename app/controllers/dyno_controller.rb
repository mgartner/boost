class DynoController < UIViewController
  attr_accessor :app, :dyno
  
  def viewDidLoad
    self.view.backgroundColor = UIColor.whiteColor
    self.title = dyno.type

    @command = UILabel.alloc.initWithFrame(CGRectMake(10, 75, 250, 44))
    @command.font = UIFont.fontWithName("Courier", size: 16)
    @command.numberOfLines = 2
    @command.text = dyno.command
    self.view.addSubview @command

    @dyno_size = UILabel.alloc.initWithFrame(CGRectMake(270, 73, 40, 44))
    @dyno_size.font = UIFont.fontWithName("HelveticaNeue-Medium", size: 16)
    @dyno_size.textColor = "#777".to_color
    @dyno_size.textAlignment = UITextAlignmentRight
    @dyno_size.text = "#{dyno.size}x"
    if @dyno.size == 1
      @dyno_size.textColor = "#8e44ad".to_color
    elsif @dyno.size == 2
      @dyno_size.textColor = "#2c3eb0".to_color
    end
    self.view.addSubview @dyno_size 

    @desc = UILabel.alloc.initWithFrame(CGRectMake(10, 160, 300, 24))
    @desc.font = UIFont.fontWithName("HelveticaNeue-Light", size: 20)
    @desc.textAlignment = UITextAlignmentCenter
    @desc.text = "Scale the number of dynos:"
    self.view.addSubview @desc

    @slider = TBCircularSlider.alloc.initWithFrame(CGRectMake(20, 200, 280, 280))
    @slider.addTarget(self, action: "slider_action:", forControlEvents: UIControlEventValueChanged)
    @slider.updateValue(dyno.quantity)
    self.view.addSubview @slider
    
    @save = UIBarButtonItem.alloc.initWithTitle("Save", style:UIBarButtonSystemItemSave, target: self, action: "save_action")
    self.navigationItem.rightBarButtonItem = @save
    self.navigationItem.rightBarButtonItem.enabled = false

  end

  def slider_action(slider)
    self.navigationItem.rightBarButtonItem.enabled = true
  end

  def save_action
    quantity = @slider.value
    SVProgressHUD.showWithStatus("Scaling Dyno...", maskType: SVProgressHUDMaskTypeGradient)    
    App.delegate.user.scale(@app.name, dyno.type, quantity) do |response|
      if response.nil?
        SVProgressHUD.showErrorWithStatus("Failed to Scale Dyno")
      else
        self.navigationItem.rightBarButtonItem.enabled = false
        SVProgressHUD.dismiss
      end
    end
  end

end
