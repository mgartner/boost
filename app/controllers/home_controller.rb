class HomeController < UIViewController
  include Teacup::TableViewDelegate
  
  def viewDidLoad
    self.title = "BOOST"
    self.navigationItem.backBarButtonItem = UIBarButtonItem.alloc.initWithTitle("Back", style: UIBarButtonItemStylePlain, target: nil, action: nil)

    @app_table = AppTableView.alloc.initWithFrame(CGRectMake(0, 0, 320, self.view.frame.size.height))
    @app_table.dataSource = self
    @app_table.delegate = self
    self.view.addSubview @app_table

    @no_apps = UILabel.alloc.initWithFrame(CGRectMake(10, 80, 300, 48))
    @no_apps.font = UIFont.fontWithName("HelveticaNeue-Light", size: 20)
    @no_apps.textAlignment = UITextAlignmentCenter
    @no_apps.text = "No Heroku apps found."
    @no_apps.hidden = true
    self.view.addSubview @no_apps

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
        @app_table.spinner.stopAnimating
        if apps.nil? || apps.empty?
          @no_apps.hidden = false
        else
          @no_apps.hidden = true
        end
      end
    end
  end

  def show_sign_in_controller(animated = true)
    sign_in_controller = SignInController.alloc.init
    sign_in_controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical
    self.presentModalViewController(sign_in_controller, animated: animated)
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
        if apps.nil? || apps.empty?
          @no_apps.hidden = false
        else
          @no_apps.hidden = true
        end
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

  def tableView(table_view, didSelectRowAtIndexPath: index_path)    
    table_view.deselectRowAtIndexPath(index_path, animated: true)
    app = @apps[index_path.row]
    app_controller = AppController.alloc.init
    app_controller.app = app
    App.delegate.navigation_controller.pushViewController(app_controller, animated: true)
  end
  
end
