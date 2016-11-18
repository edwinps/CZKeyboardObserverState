#
#  Be sure to run `pod spec lint CZKeyboardObserverState.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "CZKeyboardObserverState"
  s.version      = "1.0.0"
  s.summary      = ""
  s.author       = "Edwin Peña"
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/edwinps/CZKeyboardObserverState.git", :commit => "30dcb8bc093032fe15e0e3dd12ea3b6c8f43a689" }
  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.requires_arc = true
  s.homepage     = "https://github.com/edwinps/CZKeyboardObserverState"
  s.license      = "MIT (example)"
  s.exclude_files = "Classes/Exclude"


end
