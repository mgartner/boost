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

  # Set the SDK to 6.0.
  app.deployment_target = "6.0"

  # The name of our team distribution profile, make sure to download 
  # from the Apple Provisioning Portal and install in your keychain.
  #app.codesign_certificate = 'iPhone Distribution: GoLudo LLC'

  # The bundle identifier.
  #app.identifier = 'com.fanium.NFLFantasyFootball'

  # The filename and full path of your distribution provisioning profile.
  #app.development do
  #  app.provisioning_profile = 'NFL_Fantasy_Football_Profile.mobileprovision'
  #end

  #app.release do
  #  app.provisioning_profile = 'NFL_Fantasy_Football_Profile_Release.mobileprovision'
  #end

  # Disable attached debuggers.
  app.entitlements['get-task-allow'] = false
  
  # Apple push services.
  #app.entitlements['aps-environment'] = 'production'

  # Include frameworks.
  #app.frameworks += ['CoreData', 'AudioToolbox', 'CFNetwork',
  #                   'SystemConfiguration', 'MobileCoreServices', 'Security',
  #                   'QuartzCore', 'StoreKit', 'AssetsLibrary', 'MessageUI',
  #                   'Twitter']
  #app.weak_frameworks += ['CoreLocation', 'Accounts', 'AdSupport', 'Social']

  # Include libraries.
  #app.libs += ['/usr/lib/libsqlite3.dylib']

  # Add the necessary cocoa pods.
  app.pods do
    #pod "PrettyKit"
    #pod "SVProgressHUD"
    #pod "DAKeyboardControl"
    #pod "TTTAttributedLabel"
    #pod "SVPullToRefresh"
    pod "AFNetworking", '~> 1.3.2'
    #pod "MWFeedParser"
    #pod "OHAttributedLabel"
    pod "iRate"
    pod "LARSBar"
    #pod "Facebook-iOS-SDK"
  end

  # Include Objective-C Libraries.
  app.vendor_project('vendor/TBCircularSlider', :static)
  #app.vendor_project('vendor/SEHumanizedTime', :static)

  # Set up red/green output style.
  app.redgreen_style = :full

  # Force portrait mode.
  app.interface_orientations = [:portrait]

  # Set app icons.
  app.icons = ["homescreen_icon57.png", "homescreen_icon72.png", 
               "homescreen_icon114.png", "homescreen_icon144.png",
               "homescreen_icon512.png", "homescreen_icon1024.png"]

  # Turn off the iOS reflective shine.
  app.prerendered_icon = true

end

