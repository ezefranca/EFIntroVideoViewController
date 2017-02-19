#
# Be sure to run `pod lib lint EFIntroVideoViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EFIntroVideoViewController'
  s.version          = '0.0.5'
  s.summary          = 'A very simple IBDesignable Video Intro ViewController.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  A very simple IBDesignable Video Intro ViewController Class. Just set Class in your storyboard and set the parameters
                       DESC

  s.homepage         = 'https://github.com/ezefranca/EFIntroVideoViewController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ezefranca' => 'ezequiel.ifsp@gmail.com' }
  s.source           = { :git => 'https://github.com/ezefranca/EFIntroVideoViewController.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/ezefranca'

  s.ios.deployment_target = '8.0'

  s.source_files = 'EFIntroVideoViewController/Classes/**/*'
  
  # s.resource_bundles = {
  #   'EFIntroVideoViewController' => ['EFIntroVideoViewController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
