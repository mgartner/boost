class DynoTableViewCell < UITableViewCell
  attr_reader :title, :command, :dyno_size, :slider

  def initWithStyle(style, reuseIdentifier: identifier)
    super.tap do
      @title = subview(UILabel, :title)
      @title.font = UIFont.fontWithName("HelveticaNeue-Light", size: 24)
      @command = subview(UILabel, :command)
      @dyno_size = subview(UILabel, :dyno_size)
      @slider = TBCircularSlider.alloc.initWithFrame(CGRectMake(35, 50, 250, 250))
      self.addSubview @slider
    end
  end

end
