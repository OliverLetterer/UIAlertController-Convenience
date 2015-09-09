#
# Be sure to run `pod lib lint UIAlertControllerConvenienceAPI.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "UIAlertControllerConvenienceAPI"
  s.version          = "0.2.2"
  s.summary          = "Convenience API for UIAlertController."
  s.homepage         = "https://github.com/OliverLetterer/UIAlertController-Convenience"
  s.license          = 'MIT'
  s.author           = { "Oliver Letterer" => "oliver.letterer@gmail.com" }
  s.source           = { :git => "https://github.com/OliverLetterer/UIAlertController-Convenience.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.frameworks = 'UIKit'
end
