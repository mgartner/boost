class HomeController < UIViewController
  include Teacup::TableViewDelegate
  
  def viewDidLoad
    self.title = "BOOST"

    @app_table = AppTableView.alloc.initWithFrame(CGRectMake(0, 0, 320, self.view.frame.size.height))
    @app_table.dataSource = self
    @app_table.delegate = self
    self.view.addSubview @app_table

    @sign_out = UIBarButtonItem.alloc.initWithTitle("Sign Out", style:UIBarButtonSystemItemSave, target: self, action: "sign_out_action")
    self.navigationItem.leftBarButtonItem = @sign_out

    @refresh = UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemRefresh, target: self, action: "refresh_action")
    self.navigationItem.rightBarButtonItem = @refresh

    if App.delegate.user.nil?
      show_sign_in_controller(false)
    end
  end

  def viewWillAppear(animated)
    super

    if user = App.delegate.user
      user.apps do |apps|
        @apps = apps
        @app_table.reloadData
      end
    end
  end

  def show_sign_in_controller(animated = true)
    sign_up_controller = SignInController.alloc.init
    sign_up_controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical
    self.presentModalViewController(sign_up_controller, animated: animated)
  end

  def sign_out_action
    alert = UIAlertView.alloc.initWithTitle("Sign Out", 
        message: "Are you sure you want to sign out?",
        delegate: self,
        cancelButtonTitle: "No",
        otherButtonTitles: nil)
    alert.addButtonWithTitle("Yes")
    alert.show
  end

  def alertView(alertView, clickedButtonAtIndex: index)
    if index == 1
      App.delegate.user = nil
      Heroku::User.clear
      @apps = []
      show_sign_in_controller
    end
  end

  def refresh_action
    if user = App.delegate.user
      user.apps do |apps|
        @apps = apps
        @app_table.reloadData
      end
    end
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    cell = table_view.dequeueReusableCellWithIdentifier(self.class.to_s) ||
      AppTableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: self.class.to_s)
    cell.app = @apps[index_path.row]
    return cell
  end

  def tableView(table_view, numberOfRowsInSection: section)
    @apps ? @apps.size : 0
  end

  # Handle cell selection in the table to open a Player Card.
  def tableView(table_view, didSelectRowAtIndexPath: index_path)    
    table_view.deselectRowAtIndexPath(index_path, animated: true)
    app = @apps[index_path.row]
    app_controller = AppController.alloc.init
    app_controller.app = app
    App.delegate.navigation_controller.pushViewController(app_controller, animated: true)
  end
  
end
