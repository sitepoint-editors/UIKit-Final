//
//  AttachViewController.swift
//  Dynamics Demo
//
//  Created by Joyce Echessa on 8/26/14.
//  Copyright (c) 2014 Joyce Echessa. All rights reserved.
//

import UIKit

class AttachViewController: UIViewController {
    
    var squareView: UIView!
    var anchorView: UIView!
    var attachment: UIAttachmentBehavior!
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!

    @IBAction func handlePan(sender: UIPanGestureRecognizer) {
        
        attachment.anchorPoint = sender.locationInView(view)
        anchorView.center = sender.locationInView(view)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        squareView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        squareView.backgroundColor = UIColor.blueColor()
        view.addSubview(squareView)
        
        anchorView = UIView(frame: CGRect(x: view.center.x, y: view.center.y, width: 20, height: 20))
        anchorView.backgroundColor = UIColor.redColor()
        view.addSubview(anchorView)
        
        attachment = UIAttachmentBehavior(item: squareView, attachedToAnchor: CGPointMake(anchorView.center.x, anchorView.center.y))
        
        animator = UIDynamicAnimator(referenceView: view)
        animator.addBehavior(attachment)
        
        gravity = UIGravityBehavior(items: [squareView])
        animator.addBehavior(gravity)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
