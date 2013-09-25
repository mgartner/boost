class AppController < UIViewController
  stylesheet :app
  attr_accessor :app
  
  def viewDidLoad
    layout(self.view, :root) do
      #@label = subview(UILabel, :label)
      @dyno_table = subview(DynoTableView, :dyno_table)
      @dyno_table.dataSource = self
      #@circle_slider = subview(TBCircularSlider, :circle_slider)
    end
   # @circle_slider = TBCircularSlider.alloc.initWithFrame(CGRectMake(0, 200, 250, 250))
   # @circle_slider.addTarget(self, action: "slider_action:", forControlEvents: UIControlEventValueChanged)
   # self.view.addSubview @circle_slider
  end

  def slider_action(slider)
    puts slider.angle
    puts slider.value
    @label.text = "#{(slider.angle * slider.angle) / 1296.0}"
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
    layout(cell, :dyno_table_cell)
    dyno = @dynos[index_path.row]
    cell.title.text = dyno.type
    cell.command.text = dyno.command
    cell.dyno_size.text = dyno.size.to_s
    return cell
  end

  def tableView(table_view, numberOfRowsInSection: section)
    @dynos ? @dynos.size : 0
  end

end

