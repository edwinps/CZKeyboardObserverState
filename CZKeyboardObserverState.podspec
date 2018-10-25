#
#  Be sure to run `pod spec lint CZKeyboardObserverState.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "CZKeyboardObserverState"
  s.version      = "2.0.0"
  s.summary      = "CZKeyboardObserverState is a helper to manage keyboard events"
  s.author       = "Edwin Peña"
  s.platform     = :ios
  s.ios.deployment_target = "10.0"
  s.source  = {
        :git => "https://github.com/edwinps/CZKeyboardObserverState.git", :tag => "2.0.0"
    }
  s.source_files = 'src/**/*.{swift}'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.2' }
  s.summary = 'CZKeyboardObserverState is a class with one registered, you can listen to keyboard state events'
  s.requires_arc = true
  s.homepage     = "https://github.com/edwinps/CZKeyboardObserverState"
  s.license = { :type => 'MIT', :file => 'LICENSE.md' }
  s.swift_version = '4.2'

end
