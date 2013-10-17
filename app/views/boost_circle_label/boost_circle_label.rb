class BoostCircleLabel < UIView

  # Initializer for the circular label.
  def initWithFrame(frame)
    if super
      self.backgroundColor = UIColor.clearColor

      @label = UILabel.alloc.initWithFrame(CGRectMake(0, 0, frame.size.width, frame.size.height))
      @label.backgroundColor = UIColor.clearColor
      @label.textAlignment = UITextAlignmentCenter
      @label.font = UIFont.fontWithName("HelveticaNeue-Bold", size: 12)
      @label.textColor = "#555".to_color
      self.addSubview @label
    end
    self
  end

  # Sets the text of the label.
  def text=(text)
    @label.text = text
  end

  # Sets the font of the label.
  def font=(font)
    @label.font = font
  end

  # Sets the text color of the label.
  def textColor=(color)
    @label.textColor = color
  end

  # Set the fill color of the circle.
  def fillColor=(color)
    @fill_color = color.CGColor
    self.setNeedsDisplay
  end

  # Set the stroke color of the circle.
  def strokeColor=(color)
    @stroke_color = color.CGColor
    self.setNeedsDisplay
  end

  # Draw the circle background.
  def drawRect(rect)
    super
    context = UIGraphicsGetCurrentContext()

    # Draw outline circle
    CGContextAddEllipseInRect(context, rect)
    CGContextSetFillColor(context, CGColorGetComponents(@stroke_color || "#3c4e90".to_color.CGColor))
    CGContextFillPath(context)

    # Draw inner circle
    rect = CGRectMake(rect.origin.x + 2, rect.origin.y + 2, rect.size.width - 4, rect.size.height - 4)
    CGContextAddEllipseInRect(context, rect)
    CGContextSetFillColor(context, CGColorGetComponents(@fill_color || "#EAEAEA".to_color.CGColor))
    CGContextFillPath(context)
  end

end
