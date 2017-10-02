# CZKeyboardObserverState



## Introduction
CZKeyboardObserverState is a class with one registered, you can listen to keyboard state events

## How to get started
Just add the CZKeyboardObserverState.swift to your project and start observing.
For more details take a look at the 'usage' section.

## Requirements
CZKeyboardObserverState needs iOS 8 and higher.

## How to install
Add this to your CocoaPods Podfile.

    pod 'CZKeyboardObserverState'

## How to use
Add this to your CocoaPods Podfile.
#### Example

    import CZKeyboardObserverState

###### 1. Use the CZKeyboardObserverStateDelegate Protocol

In order to conform to the CZKeyboardObserverStateDelegate protocol you have to adopt it in your UIViewController.

	class ViewController: UIViewController, CZKeyboardObserverStateDelegate

To conform to the CZeyboardObserverDelegate you have to implement the following functions:

	
	func keyboardWillHide(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any]?){
    }
    
    func keyboardDidHide(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any]?){
    }
    
    func keyboardWillShow(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any]?){
    }
    
    func keyboardDidShow(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any]?){
    }
    
    func keyboardWillChange(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any]?){
    }
    
    func keyboardDidChange(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any]){
    }


To start observing and getting notified about keyboard state:
        
    CZKeyboardObserverState.sharedObserver.startObserving(self.view, delegate: self)

#### Stop the observer

You can stop the observer

	CZKeyboardObserverState.sharedObserver.stopObserving()


## License
CZKeyboardObserverState is licensed under the MIT licence. See the [LICENSE](https://github.com/edwinps/CZCustomLayout/blob/master/LICENSE.md) for more details.