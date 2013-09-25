class HomeController < UIViewController
  include Teacup::TableViewDelegate
  stylesheet :home
  
  def viewDidLoad
    layout(self.view, :root) do
      @app_table = subview(AppTableView, :app_table)
      @app_table.dataSource = self
      @app_table.delegate = self
    end
    self.title = "BOOST"
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

  def viewWillDisappear(animated)
    super
  end

  def show_sign_in_controller(animated = true)
    sign_up_controller = SignInController.alloc.init
    sign_up_controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical
    self.presentModalViewController(sign_up_controller, animated: animated)
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    cell = table_view.dequeueReusableCellWithIdentifier(self.class.to_s) ||
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: self.class.to_s)
    layout(cell, :app_table_cell)
    cell.textLabel.text = @apps[index_path.row].name
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
