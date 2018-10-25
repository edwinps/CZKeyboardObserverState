//
//  CZKeyboardObserverState.swift
//  CzKeyboardObserverState
//
//  Created by Edwin Peña on 17/11/16.
//  Copyright © 2016 Edwin Peña. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol CZKeyboardObserverStateDelegate: class {
    
    /** 'Keyboard will hide' event.
     - keyboardObserverState: CZKeyboardObserverState instance.
     - info: Dictionary that contains the keyboard frame values.
     */
    @objc optional func keyboardWillHide(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any]?)
    
    
    /** 'Keyboard did hide' event.
     - keyboardObserverState: CZKeyboardObserverState instance.
     - info: Dictionary that contains the keyboard frame values.
     */
    @objc optional func keyboardDidHide(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any]?)
    
    /** 'Keyboard will show' event.
     - keyboardObserverState: CZKeyboardObserverState instance.
     - info: Dictionary that contains the keyboard frame values.
     */
    @objc optional func keyboardWillShow(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any]?)
    
    /** 'Keyboard did show' event.
     - keyboardObserverState: CZKeyboardObserverState instance.
     - info: Dictionary that contains the keyboard frame values.
     */
    @objc optional func keyboardDidShow(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any]?)
    
    /** 'Keyboard will change' event.
     - keyboardObserverState: CZKeyboardObserverState instance.
     - info: Dictionary that contains the keyboard frame values.
     */
    @objc optional func keyboardWillChange(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any]?)
    
    /* 'Keyboard did change' event.
     - keyboardObserverState: CZKeyboardObserverState instance.
     - info: Dictionary that contains the keyboard frame values.
     */
    @objc optional func keyboardDidChange(_ keyboardObserverState: CZKeyboardObserverState,info: [AnyHashable: Any])
    
    
}

public class CZKeyboardObserverState : NSObject,CZKeyboardObserverStateDelegate {
    
    // singleton instance
    public static let  sharedObserver = CZKeyboardObserverState()
    open fileprivate(set) var isKeyboardShown = false
    open fileprivate(set) var keyboardSize = CGRect.zero
    // callback delegate
    fileprivate var delegate: CZKeyboardObserverStateDelegate?
    var isObserving: Bool = false
    
    fileprivate override init() {
        super.init()
        
    }
    /*
     Initializes the observer.
     adds the NSNotificationsObserver event
     Init states.
     view: view used to hide the keyboard.
     */
    func initObserver(_ view: UIView) {
        // hide the keyboard
        view.endEditing(true)
        self.addObserver()
    }
    /*
     Start observing using the CZKeyboardObserverStateDelegate as callback.
     view: the view.
     delegate: the delegate
     */
    public func startObserving(_ view: UIView, delegate: CZKeyboardObserverStateDelegate) {
        self.delegate = delegate
        self.initObserver(view)
    }
    /*
     Remove already added observer first, then add the observer keyboard notifications.
     */
    fileprivate func addObserver() {
        
        NotificationCenter.default.removeObserver(self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidChange), name: UIResponder.keyboardDidChangeFrameNotification, object: nil)
        
        self.isObserving = true
    }
    
    /*
     Stops observing.
     Removes the keyboard related notification observers and frees memory.
     */
    public func stopObserving() {
        NotificationCenter.default.removeObserver(self)
        //        self.delegate = nil
        self.isObserving = false
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        self.delegate = nil
    }
    
    //MARK: - Keyboard Notification events
    
    /*
     Notification function that gets called when the keyboard will change its frame.
     - notification: the notification instance
     */
    @objc func keyboardWillHide(_ notification: Notification) {
        // since we need the information in the dictionary we continuo
        let userInfo = (notification as NSNotification).userInfo;
        if userInfo == nil {
            print("notification doesn't contain a userInfo dictionary")
        }else{
            self.keyboardSize = ((userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) ?? CGRect.zero
        }
        
        if delegate?.keyboardWillHide != nil {
            delegate?.keyboardWillHide!(self, info: userInfo)
        }
        
    }
    /*
     Notification function that gets called when the keyboard will change its frame.
     - notification: the notification instance
     */
    @objc func keyboardDidHide(_ notification: Notification) {
        // since we need the information in the dictionary we continuo
        let userInfo = (notification as NSNotification).userInfo ?? nil;
        if userInfo == nil {
            print("notification doesn't contain a userInfo dictionary")
        }
        isKeyboardShown = false
        keyboardSize = CGRect.zero
        
        if delegate?.keyboardDidHide != nil {
            delegate?.keyboardDidHide!(self, info: userInfo)
        }
    }
    /*
     Notification function that gets called when the keyboard will change its frame.
     - notification: the notification instance
     */
    @objc func keyboardWillShow(_ notification: Notification) {
        
        if !self.isKeyboardShown {
            // since we need the information in the dictionary we continuo
            let userInfo = (notification as NSNotification).userInfo;
            if userInfo == nil {
                print("notification doesn't contain a userInfo dictionary")
            }else{
                self.keyboardSize = ((userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) ?? CGRect.zero
            }
            if delegate?.keyboardWillShow != nil {
                delegate?.keyboardWillShow!(self, info: userInfo)
            }
        }
    }
    /*
     Notification function that gets called when the keyboard will change its frame.
     - notification: the notification instance
     */
    @objc func keyboardDidShow(_ notification: Notification) {
        if !isKeyboardShown {
            isKeyboardShown = true
            // since we need the information in the dictionary we can cancel if there is none
            guard let userInfo = (notification as NSNotification).userInfo else {
                print("notification doesn't contain a userInfo dictionary")
                return
            }
            self.keyboardSize = ((userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) ?? CGRect.zero
            
            if delegate?.keyboardDidShow != nil {
                delegate?.keyboardDidShow!(self, info: userInfo)
            }
            
        }
    }
    
    /*
     Notification function that gets called when the keyboard will change its frame.
     - notification: the notification instance
     */
    @objc func keyboardWillChange(_ notification: Notification) {
        // since we need the information in the dictionary we continuo
        let userInfo = (notification as NSNotification).userInfo;
        if userInfo == nil {
            print("notification doesn't contain a userInfo dictionary")
        }else{
            self.keyboardSize = ((userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) ?? CGRect.zero
        }
        
        if delegate?.keyboardWillChange != nil {
            delegate?.keyboardWillChange!(self, info: userInfo)
        }
    }
    /*
     Notification function that gets called when the keyboard will change its frame.
     - notification: the notification instance
     */
    @objc func keyboardDidChange(_ notification: Notification) {
        // since we need the information in the dictionary we can cancel if there is none
        guard let userInfo = (notification as NSNotification).userInfo else {
            print("notification doesn't contain a userInfo dictionary")
            return
        }
        self.keyboardSize = ((userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue)!
        
        if delegate?.keyboardDidChange != nil {
            delegate?.keyboardDidChange!(self, info: userInfo)
        }
        
    }
    
}

