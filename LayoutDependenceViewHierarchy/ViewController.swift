//
//  ViewController.swift
//  LayoutDependenceViewHierarchy
//
//  Created by wangqiang li on 6/2/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var leadingConstraint: NSLayoutConstraint!

    @IBOutlet var arrangedView: ArrangedView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func scaleContainer(_ sender: UIButton) {
        
        if leadingConstraint.constant == 50 {
            leadingConstraint.constant = 100
        } else {
           leadingConstraint.constant = 50
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
}


final class ArrangedView: UIView {
    
    @IBOutlet var leftButton: UIButton!
    @IBOutlet var middleButton: UIButton!
    @IBOutlet var middleConstraint: NSLayoutConstraint!
    
    // https://objccn.io/issue-3-5/
    // https://developer.apple.com/videos/play/wwdc2012/228/
    override func layoutSubviews() {
        super.layoutSubviews()
        if didMixed() {
            middleConstraint.constant = -100
            super.layoutSubviews()
        } else if middleConstraint.constant != 0 {
             middleConstraint.constant = 0
            super.layoutSubviews()
        }
    }
    
    func didMixed() -> Bool {
        return self.leftButton.frame.intersects(self.middleButton.frame)
    }
    
}
