class AppTableView < UITableView

  def initWithFrame(frame, style: style)
    super.tap do
      #self.stylesheet = :app_table_view
      subview(UIView, :zero_view)
      @spinner = subview(UIActivityIndicatorView, :spinner)
      @spinner.startAnimating
    end
  end

  def reloadData
    super
    if numberOfRowsInSection(0) > 0
      @spinner.stopAnimating
    end
  end

end




=begin
  # view example
#
# if you use Teacup in all your projects, you can bundle your custom views with
# their own stylesheets
def MyView < UIView

  def initWithFrame(frame)
    super.tap do
      self.stylesheet = :my_stylesheet
      subview(UIImageView, :image)
    end
  end

end
rel
  DEFAULT_CELL_HEIGHT = 54

  attr_accessor :league

  # Initializer for a FANPlayerTableView.
  def initWithFrame(frame)
    if self.initWithFrame(frame, style: UITableViewStylePlain)
      self.dataSource = self
      self.delegate = self
      self.backgroundColor = UIColor.whiteColor
      self.rowHeight = DEFAULT_CELL_HEIGHT
      self.separatorColor = UIColor.clearColor

      # Hide empty cell separators.
      zero_view = UIView.alloc.initWithFrame(CGRectZero)
      zero_view.backgroundColor = UIColor.clearColor
      self.tableFooterView = zero_view

      @activity_indicator = UIActivityIndicatorView.alloc.initWithActivityIndicatorStyle(UIActivityIndicatorViewStyleWhite)
      @activity_indicator.color = Color.light_text
      @activity_indicator.hidesWhenStopped = true
      @activity_indicator.center = [frame.size.width / 2, 70]
      @activity_indicator.startAnimating
      self.addSubview(@activity_indicator)
    end
    self
  end

  # Set the players to be displayed in the table.
  # Takes an array of players as input.
  def setPlayers(players)
    if !players.empty?
      @activity_indicator.stopAnimating
    end
    @players = players
    self.reloadData
  end

  # Set Current user drafting boolean.
  def setDrafting(user_can_draft)
    @user_can_draft = user_can_draft
  end

  # Set the callback when a draft button is clicked.
  def onDraftClick(&block)
    @draft_click_handler = block
  end

  # Scroll to the top of the player table.
  def scrollToTop
    self.setContentOffset(CGPointMake(0, 0), animated: false)
  end

  # Returns the number of items in the table.
  # Necessary when setting the dataSource as self.
  def tableView(tableView, numberOfRowsInSection: section)
    return @players ? @players.count : 0
  end

  # Handle cell selection in the table to open a Player Card.
  def tableView(tableView, didSelectRowAtIndexPath: indexPath)    
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    player = @players[indexPath.row]
    player_card_controller = PlayerCardController.alloc.initWithNibName(nil, bundle: nil)
    player_card_controller.player = player
    player_card_controller.can_watch = true
    player_card_controller.league = @league
    App.delegate.home_controller.push_center(player_card_controller)
  end

  # Returns a cell for a given index in the table.
  # Necessary when setting the dataSource as self.
  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    @reuseIdentifier ||= "FPTVCI"
    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      FANPlayerTableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, 
                                                 reuseIdentifier: @reuseIdentifier)
    end

    player = @players[indexPath.row]
    cell.setPlayer(player, @user_can_draft)
    cell.onDraftClick(@draft_click_handler)
    return cell
  end

  # Set the callback when the scroll view will begin dragging.
  def on_scroll(&block)
    @on_scroll = block
  end

  # Call the on scroll callback.
  def scrollViewWillBeginDragging(scroll_view)
    @on_scroll.call if @on_scroll
  end

end
=end
