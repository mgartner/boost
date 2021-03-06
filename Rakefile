# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'rubygems'

# Include the gems from the Gemfile.
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  
  # Set the app name on the homescreen.
  app.name = "Boost"

  # Set the app version number.
  app.version = "1.0.0"
  app.short_version = "1.0.0"

  # Set the SDK to 7.0.
  app.deployment_target = "7.0"

  # The name of our team distribution profile, make sure to download 
  # from the Apple Provisioning Portal and install in your keychain.
  app.codesign_certificate = 'iPhone Distribution: Marcus Gartner'

  # The bundle identifier.
  app.identifier = 'com.marcusgartner.boost'

  # The filename and full path of your distribution provisioning profile.
  app.development do
    app.provisioning_profile = 'boost_ad_hoc.mobileprovision'
  end

  app.release do
    app.provisioning_profile = 'boost_release.mobileprovision'
  end

  # Disable attached debuggers.
  app.entitlements['get-task-allow'] = false

  # Add the necessary cocoa pods.
  app.pods do
    pod "SVProgressHUD", :head
    pod "AFNetworking", '~> 1.3.2'
    pod "iRate"
  end

  # Include Objective-C Libraries.
  app.vendor_project('vendor/TBCircularSlider', :static)

  # Set up red/green output style.
  app.redgreen_style = :full

  # Force portrait mode.
  app.interface_orientations = [:portrait]

  # Set app icons.
  app.icons = ["icon57.png", "icon72.png", "icon114.png", "icon144.png",
               "icon512.png", "icon1024.png", "icon76.png", "icon120.png",
               "icon152.png"]

  # Turn off the iOS reflective shine.
  app.prerendered_icon = true

end

