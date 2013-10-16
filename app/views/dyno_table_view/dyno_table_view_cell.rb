class DynoTableViewCell < UITableViewCell
  attr_reader :title, :command, :dyno_size, :save

  def initWithStyle(style, reuseIdentifier: identifier)
    super.tap do

      self.accessoryType = UITableViewCellAccessoryDisclosureIndicator

      @title = UILabel.alloc.initWithFrame(CGRectMake(15, 8, 215, 22))
      @title.font = UIFont.fontWithName("HelveticaNeue-Light", size: 18)
      self.contentView.addSubview @title

      @command = UILabel.alloc.initWithFrame(CGRectMake(15, 33, 215, 20))
      @command.font = UIFont.fontWithName("CourierNewPSMT", size: 14)
      @command.textColor = "#777".to_color
      self.contentView.addSubview @command
      
      @dyno_number = UILabel.alloc.initWithFrame(CGRectMake(230, 8, 40, 22))
      @dyno_number.font = UIFont.fontWithName("HelveticaNeue-Light", size: 18)
      @dyno_number.textAlignment = UITextAlignmentRight
      self.contentView.addSubview @dyno_number

      @dyno_size = UILabel.alloc.initWithFrame(CGRectMake(230, 32, 40, 20))
      @dyno_size.font = UIFont.fontWithName("HelveticaNeue", size: 14)
      @dyno_size.textAlignment = UITextAlignmentRight
      self.contentView.addSubview @dyno_size

    end
  end

  def dyno=(dyno)
    @title.text = dyno.type
    @command.text = dyno.command
    @dyno_size.text = "#{dyno.size.to_s}x"
    @dyno_number.text = dyno.quantity.to_s

    if dyno.size == 1
      @dyno_size.textColor = "#e67e22".to_color
    elsif dyno.size == 2
      @dyno_size.textColor = "#e74c3c".to_color
    else
      @dyno_size.textColor = "#777".to_color
    end
  end

end
