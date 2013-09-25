class DynoTableView < UITableView

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
