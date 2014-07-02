//
//  LDMainViewController.swift
//  QsbkClient
//
//  Created by Zombie on 7/2/14.
//  Copyright (c) 2014 Zombie. All rights reserved.
//

import UIKit

class LDMainViewController: UITabBarController {
    
    var bottomTabBar: UIView?
    var slider: UIView?
    let themeRedColor   = UIColor.redColor();
    let tabTitleArray   = ["最新", "热门", "真相"]
    
    init(nibName nibNameOrNil: String?, bundle nibNundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibNundleOrNil)
        title = tabTitleArray[0]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        automaticallyAdjustsScrollViewInsets = false
        view!.backgroundColor = UIColor.whiteColor()
        tabBar.hidden = true
        var width   = view.frame.size.width
        var height  = view.frame.size.height
        self.bottomTabBar = UIView(frame: CGRectMake(0, height - 49, width, 49))
        self.bottomTabBar!.backgroundColor = themeRedColor
        self.slider = UIView(frame: CGRectMake(0, 0, 107, 49))
        self.slider!.backgroundColor = UIColor.whiteColor()
        self.bottomTabBar!.addSubview(slider)
        self.view.addSubview(bottomTabBar)
        
        for index in 0..tabTitleArray.count {
            var title = tabTitleArray[index]
            var btnWidth = (CGFloat)(index * 107)
            var button = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
            button.frame = CGRectMake(btnWidth, 0, 107, 49)
            button.tag = index + 100
            button.setTitle(title, forState: UIControlState.Normal)
            button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            button.setTitleColor(themeRedColor, forState: UIControlState.Selected)
            button.addTarget(self, action: "tabBarButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            bottomTabBar!.addSubview(button)
            if index == 0 {
                button.selected = true
            }
        }
    }
    
    func tabBarButtonClicked(sender: UIButton) {
        var index = sender.tag
        
        for i in 0..tabTitleArray.count {
            var button = view.viewWithTag(i + 100) as UIButton
            
            button.selected = button.tag == index
            if button.tag == index {
                button.setTitleColor(themeRedColor, forState: UIControlState.Normal)
            } else {
                button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            }
        }
        
        UIView.animateWithDuration(0.3, {
                self.slider!.frame = CGRectMake(CGFloat(index - 100) * 107, 0,107,49)
            })
        title = tabTitleArray[index - 100] as String
        selectedIndex = index - 100
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
