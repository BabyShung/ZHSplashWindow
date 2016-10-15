//
//  View+AutoLayout.swift
//  InteractiveTransition
//
//  Created by Hao Zheng on 9/1/16.
//  Copyright © 2016 Hao Zheng. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
        public autolayout helpers
    */
    func pinAllEdges(to: UIView) {
        constraintPinToTop(to)
        constraintPinToLeading(to)
        constraintPinToBottom(to)
        constraintPinToTrailing(to)

        /* or
         to.addSubview(self)
         self.translatesAutoresizingMaskIntoConstraints = false
         let dict = getSelfDict()
         for format in ["H:|[view]|", "V:|[view]|"] {
         to.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dict))
         }
         */
    }
    
    func widthConstraint(_ width: CGFloat) {
        widthHeightConstraintHelper(width, isWidth: true)
    }
    
    func heightConstraint(_ height: CGFloat) {
        widthHeightConstraintHelper(height, isWidth: false)
    }
    
    func equalWidthToParent(_ parent: UIView) {
        addSingleConstraintToParent(parent, attr: .width)
    }
    
    func equalHeightToParent(_ parent: UIView) {
        addSingleConstraintToParent(parent, attr: .height)
    }
    
    func centerXToParent(_ parent: UIView) {
        addSingleConstraintToParent(parent, attr: .centerX)
    }
    
    func centerYToParent(_ parent: UIView) {
        addSingleConstraintToParent(parent, attr: .centerY)
    }
    
    func constraintPinToTop(_ parent: UIView) {
        addSingleConstraintToParent(parent, attr: .top)
    }
    
    func constraintPinToLeading(_ parent: UIView) {
        addSingleConstraintToParent(parent, attr: .left)
    }
    
    func constraintPinToBottom(_ parent: UIView) {
        addSingleConstraintToParent(parent, attr: .bottom)
    }
    
    func constraintPinToTrailing(_ parent: UIView) {
        addSingleConstraintToParent(parent, attr: .trailing)
    }
    
    /**
     private autolayout helpers
     */
    fileprivate func addSelfToParent(_ parent: UIView) {
        if self.isDescendant(of: parent) { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(self)
    }
    
    fileprivate func addSingleConstraintToParent(_ parent: UIView, attr: NSLayoutAttribute) {
        addSelfToParent(parent)
        parent.addConstraint(NSLayoutConstraint.init(item: self, attribute: attr, relatedBy: .equal, toItem: parent, attribute: attr, multiplier: 1, constant: 0))
    }
    
    fileprivate func getSelfDict() -> Dictionary<String, UIView> {
        return ["view" : self]
    }
    
    fileprivate func widthHeightConstraintHelper(_ value: CGFloat, isWidth: Bool) {
        let dict = getSelfDict()
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: String.init(format: "%@:[view(%f)]", isWidth ? "H" : "V", value), options:NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: dict))
    }
    
}
