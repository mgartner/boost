Teacup::Stylesheet.new :app do
  style :root,
    backgroundColor: "#2c3e50".to_color
  style :dyno_table,
    origin: [0, 0],
    size: ["100%", "100%"],
    backgroundColor: UIColor.clearColor,
    rowHeight: 300
  style :dyno_table_cell,
    backgroundColor: UIColor.clearColor,
    title: {
      origin: [10, 10],
      size: ["100%", 20],
      textColor: UIColor.whiteColor
    },
    command: {
      origin: [10, 30],
      size: ["100%", 20],
      textColor: UIColor.whiteColor#"#AAA".to_color
    }
end

