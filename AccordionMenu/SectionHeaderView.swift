//
//  SectionHeaderViewTableViewCell.swift
//  AccordionMenu
//
//  Created by super_user on 5/6/15.
//  Copyright (c) 2015 DevCom. All rights reserved.
//

import UIKit

private let NIB_NAME = "SectionHeaderView"

typealias HandlerSectionDidTap = (headerView: SectionHeaderView) -> Void

class SectionHeaderView: UIView {
    
    private var view: UIView!
    private var _handler: HandlerSectionDidTap?
    
    
    var handler: HandlerSectionDidTap? {
        set(handler) {
            let headerTapped = UITapGestureRecognizer (target: self, action:"sectionHeaderTapped:")
            self.addGestureRecognizer(headerTapped)
            
            _handler = handler
        }
        get {
            return _handler
        }
    }
    
    /*
    * MARK - Gesture action
    */
    
    func sectionHeaderTapped(gesture: UITapGestureRecognizer) {
        
        _handler?(headerView: self)
    }
    
    /*
    * MARK - init
    */
    override init(frame: CGRect) {
        // 1. setup any properties here
        
        // 2. call super.init(frame:)
        super.init(frame: frame)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    required init(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: NIB_NAME, bundle: bundle)
        
        // Assumes UIView is top level and only object in CustomView.xib file
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }
}
