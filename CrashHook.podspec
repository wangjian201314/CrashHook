#
# Be sure to run `pod lib lint CrashHook.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CrashHook'
  s.version          = '1.0.4'
  s.summary          = 'A short description of CrashHook.'
  s.homepage         = 'https://github.com/wangjian201314/CrashHook'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wangjian' => '2576175431@qq.com' }
  s.source           = { :git => 'https://github.com/wangjian201314/CrashHook.git', :tag => s.version.to_s, :commit => "2dfc6924c160d7222571330fb15eb20fa3974a1b" }
  s.ios.deployment_target = '9.0'
  s.source_files = "CrashHook/Classes/*.{h,m}"
  
  # s.resource_bundles = {
  #   'CrashHook' => ['CrashHook/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
