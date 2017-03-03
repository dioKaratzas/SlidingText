#
# Be sure to run `pod lib lint SlidingText.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SlidingText'
  s.version          = '1.0.1'
  s.summary          = 'Swift UIView for sliding text with page indicator.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
An UIVIew control for sliding text with page indicator built upon UIKitDynamic using Swift. Simple and effecient. \n
                       DESC

  s.homepage         = 'https://github.com/dnKaratzas/SlidingText'
  # s.screenshots     = 'https://image.ibb.co/ixmtJv/Sliding_Text.gif', 'https://image.ibb.co/dJ8Jka/Sliding_Text.png', 'https://image.ibb.co/iDy7dv/Sliding_Text2.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dnKaratzas' => 'dkaratzas@hotmail.com' }
  s.source           = { :git => 'https://github.com/dnKaratzas/SlidingText.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SlidingText/**/*'
  
  # s.resource_bundles = {
  #   'SlidingText' => ['SlidingText/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
