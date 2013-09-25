Teacup::Stylesheet.new :home do
  style :root,
    backgroundColor: "#2c3e50".to_color
  style :app_table,
    origin: [0, 0],
    size: ["100%", "100%"],
    backgroundColor: UIColor.clearColor
  style :app_table_cell,
    backgroundColor: UIColor.clearColor,
    accessoryType: UITableViewCellAccessoryDisclosureIndicator,
    textLabel: {
      textColor: UIColor.whiteColor
    }
end
