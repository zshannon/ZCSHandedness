#
# Be sure to run `pod lib lint ZCSHandedness.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ZCSHandedness"
  s.version          = "0.0.1"
  s.summary          = "ZCSHandedness tries to determine which hand the device is in."
  s.description      = <<-DESC
                       ZCSHandedness tries to determine which hand the user is holding their device in, and sends you updates as that changes.
                       DESC
  s.homepage         = "https://github.com/zshannon/ZCSHandedness"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Zane Shannon" => "zane@smileslaughs.com" }
  s.source           = { :git => "https://github.com/zshannon/ZCSHandedness.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/zaneshannon'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = "ZCSHandedness.{h,m}"

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
