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
    s.summary      = "CZKeyboardObserverState to listen to keyboard state events"

    s.description  = <<-DESC
                     CZKeyboardObserverState is a class with one registered, you can listen to keyboard state events
                     DESC

    s.homepage     = "https://github.com/edwinps/CZKeyboardObserverState"
    s.license      = { :type => 'MIT', :file => 'LICENSE.md' }
    s.author             = "Edwin Peña"
    s.platform     = :ios, "8.0"
    s.source       = { :git => "https://github.com/edwinps/CZKeyboardObserverState.git", :tag => s.version }
    s.source_files  = "CZKeyboardObserverState/*.swift"

end
