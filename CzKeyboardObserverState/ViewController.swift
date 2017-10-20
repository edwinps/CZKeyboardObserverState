//
//  ViewController.swift
//  CzKeyboardObserverState
//
//  Created by Edwin Peña on 17/11/16.
//  Copyright © 2016 Edwin Peña. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CZKeyboardObserverStateDelegate {
    
    // textView used to trigger the keyboard events
    @IBOutlet weak var textView: UITextView!
    // label that displays the current keyboards state and the callback method
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var constraintBtt: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // start the observer
        CZKeyboardObserverState.sharedObserver.startObserving(self.view, delegate: self)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // stop observing
        CZKeyboardObserverState.sharedObserver.stopObserving()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: CZKeyboardObserverState
    func keyboardWillHide(_ keyboardObserverState: CZKeyboardObserverState, info: [AnyHashable: Any]?){
        NSLog("keyboardWillHide \(String(describing: info))")
        constraintBtt.constant = 20
        stateLabel.text = "keyboardWillHide"
    }
    
    func keyboardDidHide(_ keyboardObserverState: CZKeyboardObserverState, info: [AnyHashable: Any]?){
        NSLog("keyboardDidHide \(String(describing: info))")
        stateLabel.text = "keyboardDidHide"
    }
    
    func keyboardWillShow(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any]?){
        NSLog("keyboardWillShow \(String(describing: info))")
        stateLabel.text = "keyboardWillShow"
        constraintBtt.constant += keyboardObserverState.keyboardSize.height
    }
    
    func keyboardDidShow(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any]?){
        NSLog("keyboardDidShow \(String(describing: info))")
        stateLabel.text = "keyboardDidShow"
    }
    
    func keyboardWillChange(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any]?){
        NSLog("keyboardWillChange \(String(describing: info))")
        stateLabel.text = "keyboardWillChange"
    }
    
    func keyboardDidChange(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any]){
        NSLog("keyboardDidChange \(String(describing: info))")
        stateLabel.text = "keyboardDidChange"
    }
}

