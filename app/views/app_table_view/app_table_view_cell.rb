class AppTableViewCell < UITableViewCell

  def initWithStyle(style, reuseIdentifier: identifier)
    super.tap do

      self.accessoryType = UITableViewCellAccessoryDisclosureIndicator

      @title = UILabel.alloc.initWithFrame(CGRectMake(15, 18, 240, 26))
      @title.font = UIFont.fontWithName("HelveticaNeue-Light", size: 20)
      self.contentView.addSubview @title
    end
  end

  def app=(app)
    @title.text = app.name
  end

end

