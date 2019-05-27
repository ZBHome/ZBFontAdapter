#
#  Be sure to run `pod spec lint ZBFontAdapter.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name          = 'ZBFontAdapter'
  s.version       = '1.0'
  s.summary       = 'iOS控件尺寸及字体大小适配'
  s.homepage      = 'https://github.com/ZBHome/ZBFontAdapter'
  s.license       = { :type => 'MIT', :file => 'LICENSE' }
  s.author        = { 'CodeMrZB' => 'https://github.com/ZBHome' }
  s.platform      = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.source        = { :git => 'https://github.com/ZBHome/ZBFontAdapter.git', :tag => s.version.to_s }
  s.source_files  = 'ZBFontAdapter/ZBFontAdapter/ZBFontAdapter/**/*.{h,m}'
  s.requires_arc = true
end
