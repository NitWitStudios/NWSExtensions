#
# Be sure to run `pod lib lint NWSExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NWSExtensions'
  s.version          = '1.0.0'
  s.summary          = 'A collection of useful and common UIKit and Foundation Framework Extensions.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'NWSExtensions comes packaged with a lot of great (and frequently used) extensions to existing core UIKit and Foundation classes and methods.'

  s.homepage         = 'https://github.com/NitWitStudios/NWSExtensions'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'James Hickman' => 'james.hickman@nitwitstudios.com' }
  s.source           = { :git => 'https://github.com/NitWitStudios/NWSExtensions.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/NitWitStudios'

  s.ios.deployment_target = '8.0'

  s.source_files = 'NWSExtensions/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NWSExtensions' => ['NWSExtensions/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
