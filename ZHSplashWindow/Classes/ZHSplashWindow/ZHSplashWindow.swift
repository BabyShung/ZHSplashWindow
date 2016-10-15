//
//  ZHSplashWindow.swift
//  ZHSplashWindow
//
//  Created by Hao Zheng on 10/14/16.
//  Copyright © 2016 Planhola. All rights reserved.
//

import UIKit

class ZHSplashWindow: UIWindow {

    fileprivate(set) var isAuthenticating: Bool
    fileprivate var launchScreen: UIView?
    
    override init(frame: CGRect) {
        self.isAuthenticating = false
        super.init(frame: frame)
        setupDefaults()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public
    func show(show: Bool, animated: Bool) {
        let view = self
        guard view.isHidden != show else { return }
        if show {
            makeKeyAndVisible()
        } else {
            isAuthenticating = false
        }
        
        if animated {
            UIView.animate(withDuration: 0.25, animations: { 
                view.alpha = show ? 1 : 0
                }, completion: { _ in
                    view.isHidden = !show
            })
        } else {
            view.isHidden = !show
        }
    }
    
    func showSplashViewIfNecessary() {
        //if should show passcode touchID
        
    }
    
    func authenticateIfNecessary() {
        
    }
    
    func authenticateIfNecessary(completionBlock: ((Bool) -> ())?) {
        let willShowPasscodeTouchID = false //TODO
        show(show: willShowPasscodeTouchID, animated: !willShowPasscodeTouchID)
        
        if willShowPasscodeTouchID {
            isAuthenticating = true
            //
        }
        
        if let cb = completionBlock {
            cb(willShowPasscodeTouchID)
        }
    }
    
    
    //MARK: Private
    private func setupDefaults() {
        if let launchScreen = Bundle.main.loadNibNamed("LaunchScreen", owner: nil, options: nil)?.first as? UIView {
            self.launchScreen = launchScreen
            launchScreen.pinAllEdges(to: self)
        }
        self.isHidden = true
        rootViewController = UIViewController()
        rootViewController?.view.isHidden = true
    }
    
    private func showTouchID() {
        
    }
    
    private func showPasscodeView() {
        
    }
}
