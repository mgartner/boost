class DynoTableViewCell < UITableViewCell
  attr_reader :title, :command, :dyno_size, :save

  def initWithStyle(style, reuseIdentifier: identifier)
    super.tap do
      self.accessoryType = UITableViewCellAccessoryDisclosureIndicator

      @title = UILabel.alloc.initWithFrame(CGRectMake(15, 6, 215, 24))
      @title.font = UIFont.fontWithName("HelveticaNeue-Light", size: 20)
      self.contentView.addSubview @title

      @command = UILabel.alloc.initWithFrame(CGRectMake(15, 35, 215, 20))
      @command.font = UIFont.fontWithName("CourierNewPSMT", size: 16)
      self.contentView.addSubview @command
      
      @dyno_number = UILabel.alloc.initWithFrame(CGRectMake(245, 6, 40, 24))
      @dyno_number.font = UIFont.fontWithName("HelveticaNeue", size: 20)
      @dyno_number.textAlignment = UITextAlignmentCenter
      self.contentView.addSubview @dyno_number

      @dyno_size = BoostCircleLabel.alloc.initWithFrame(CGRectMake(252, 31, 26, 26))
      self.contentView.addSubview @dyno_size

    end
  end

  def dyno=(dyno)
    @title.text = dyno.type
    @command.text = dyno.command
    @dyno_size.text = "#{dyno.size.to_s}x"
    @dyno_number.text = dyno.quantity.to_s
    if dyno.size == 1
      @dyno_size.fillColor = "#EAEAEA".to_color
      @dyno_size.textColor = "#2c3e50".to_color
    elsif dyno.size == 2
      @dyno_size.fillColor = "#AAAAEA".to_color
      @dyno_size.textColor = UIColor.whiteColor
    end
  end

end
