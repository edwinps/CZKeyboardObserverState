//
//  ViewController.swift
//  CzKeyboardObserverState
//
//  Created by Edwin Peña on 17/11/16.
//  Copyright © 2016 Edwin Peña. All rights reserved.
//

import UIKit

class ViewController: UIViewController , CZKeyboardObserverStateDelegate{
    
    // textView used to trigger the keyboard events
    @IBOutlet weak var textView: UITextView!
    
    // label that displays the current keyboards state and the callback method
    @IBOutlet weak var stateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CZKeyboardObserverState.sharedObserver.startObserving(self.view, delegate: self)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: CZKeyboardObserverState
    func keyboardWillHide(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any]?){
       NSLog("keyboardWillHide \(info)")
    }
    
    func keyboardDidHide(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any]?){
       NSLog("keyboardDidHide \(info)")
    }
    
    func keyboardWillShow(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any]?){
      NSLog("keyboardWillShow \(info)")
    }

    func keyboardDidShow(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any]?){
       NSLog("keyboardDidShow \(info)")
    }
    
    func keyboardWillChange(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any]?){
       NSLog("keyboardWillChange \(info)")
    }

    func keyboardDidChange(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any]){
        NSLog("keyboardDidChange \(info)")
    }
}

