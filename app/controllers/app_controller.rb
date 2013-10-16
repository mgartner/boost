class AppController < UIViewController
  attr_accessor :app
  
  def viewDidLoad
    self.title = app.name
    self.navigationItem.backBarButtonItem = UIBarButtonItem.alloc.initWithTitle("Back", style: UIBarButtonItemStylePlain, target: nil, action: nil)

    @dyno_table = DynoTableView.alloc.initWithFrame(CGRectMake(0, 0, 320, self.view.frame.size.height))
    @dyno_table.dataSource = self
    @dyno_table.delegate = self
    self.view.addSubview @dyno_table
  end

  def viewWillAppear(animated)
    super

    if user = App.delegate.user
      user.dynos(app.name) do |dynos|
        @dynos = dynos
        @dyno_table.reloadData
      end
    end
  end

  def viewWillDisappear(animated)
    super
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
     cell = table_view.dequeueReusableCellWithIdentifier(self.class.to_s) ||
      DynoTableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: self.class.to_s)
    cell.dyno = @dynos[index_path.row]
    return cell
  end

  def tableView(table_view, numberOfRowsInSection: section)
    @dynos ? @dynos.size : 0
  end

  def tableView(table_view, didSelectRowAtIndexPath: index_path)
    table_view.deselectRowAtIndexPath(index_path, animated: true)
    dyno = @dynos[index_path.row]
    dyno_controller = DynoController.alloc.init
    dyno_controller.app = @app
    dyno_controller.dyno = dyno
    App.delegate.navigation_controller.pushViewController(dyno_controller, animated: true)
  end

end
