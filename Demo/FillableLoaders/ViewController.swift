//
//  ViewController.swift
//  FillableLoaders
//
//  Created by Pol Quintana on 2/8/15.
//  Copyright (c) 2015 Pol Quintana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var segmentedControl: UISegmentedControl = UISegmentedControl()
    var loader: FillableLoader = FillableLoader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        loader = WavesLoader.showLoaderWithPath(path())
        setupSubviews()
    }
    
    func setupSubviews() {
        var imageView = UIImageView(image: UIImage(named: "bg.png"))
        imageView.frame = view.frame
        view.addSubview(imageView)
        
        let margin: CGFloat = 30
        let width: CGFloat = view.frame.width
        let height: CGFloat = view.frame.height
        let window = UIApplication.sharedApplication().delegate?.window!
        let items = ["Waves", "Plain", "Spike", "Rounded"]
        segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layer.cornerRadius = 5.0
        segmentedControl.backgroundColor = UIColor.whiteColor()
        segmentedControl.tintColor = UIColor(white: 0.2, alpha: 1)
        segmentedControl.frame = CGRectMake(margin, height - margin - 40, width - margin*2, 40)
        segmentedControl.addTarget(self, action: "segmentedControlTouch:", forControlEvents: .ValueChanged)
        window!.addSubview(segmentedControl)
    }
    
    func segmentedControlTouch(sender: UISegmentedControl) {
        loader.removeLoader()
        switch sender.selectedSegmentIndex {
        case 1:
            loader = PlainLoader.showLoaderWithPath(path())
        case 2:
            loader = SpikeLoader.showLoaderWithPath(path())
        case 3:
            loader = RoundedLoader.showLoaderWithPath(path())
        default:
            loader = WavesLoader.showLoaderWithPath(path())
        }
        let window = UIApplication.sharedApplication().delegate?.window!
        window!.bringSubviewToFront(segmentedControl)
    }
    
    func path() -> CGPath {
        //Created with PaintCode
        var bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(190, 281))
        bezierPath.addCurveToPoint(CGPointMake(142, 329), controlPoint1: CGPointMake(163.49, 281), controlPoint2: CGPointMake(142, 302.49))
        bezierPath.addCurveToPoint(CGPointMake(190, 377), controlPoint1: CGPointMake(142, 355.51), controlPoint2: CGPointMake(163.49, 377))
        bezierPath.addCurveToPoint(CGPointMake(238, 329), controlPoint1: CGPointMake(216.51, 377), controlPoint2: CGPointMake(238, 355.51))
        bezierPath.addCurveToPoint(CGPointMake(190, 281), controlPoint1: CGPointMake(238, 302.49), controlPoint2: CGPointMake(216.51, 281))
        bezierPath.closePath()
        bezierPath.moveToPoint(CGPointMake(209.52, 320.32))
        bezierPath.addCurveToPoint(CGPointMake(209.55, 321.55), controlPoint1: CGPointMake(209.54, 320.73), controlPoint2: CGPointMake(209.55, 321.14))
        bezierPath.addCurveToPoint(CGPointMake(182.65, 348.44), controlPoint1: CGPointMake(209.55, 334.04), controlPoint2: CGPointMake(200.04, 348.44))
        bezierPath.addCurveToPoint(CGPointMake(168.16, 344.2), controlPoint1: CGPointMake(177.31, 348.44), controlPoint2: CGPointMake(172.34, 346.88))
        bezierPath.addCurveToPoint(CGPointMake(170.41, 344.33), controlPoint1: CGPointMake(168.9, 344.28), controlPoint2: CGPointMake(169.65, 344.33))
        bezierPath.addCurveToPoint(CGPointMake(182.16, 340.28), controlPoint1: CGPointMake(174.84, 344.33), controlPoint2: CGPointMake(178.92, 342.82))
        bezierPath.addCurveToPoint(CGPointMake(173.32, 333.72), controlPoint1: CGPointMake(178.02, 340.21), controlPoint2: CGPointMake(174.53, 337.47))
        bezierPath.addCurveToPoint(CGPointMake(175.1, 333.89), controlPoint1: CGPointMake(173.9, 333.83), controlPoint2: CGPointMake(174.49, 333.89))
        bezierPath.addCurveToPoint(CGPointMake(177.59, 333.56), controlPoint1: CGPointMake(175.96, 333.89), controlPoint2: CGPointMake(176.8, 333.77))
        bezierPath.addCurveToPoint(CGPointMake(170.01, 324.28), controlPoint1: CGPointMake(173.27, 332.69), controlPoint2: CGPointMake(170.01, 328.87))
        bezierPath.addCurveToPoint(CGPointMake(170.01, 324.17), controlPoint1: CGPointMake(170.01, 324.24), controlPoint2: CGPointMake(170.01, 324.2))
        bezierPath.addCurveToPoint(CGPointMake(174.29, 325.35), controlPoint1: CGPointMake(171.28, 324.87), controlPoint2: CGPointMake(172.74, 325.3))
        bezierPath.addCurveToPoint(CGPointMake(170.09, 317.48), controlPoint1: CGPointMake(171.75, 323.65), controlPoint2: CGPointMake(170.09, 320.76))
        bezierPath.addCurveToPoint(CGPointMake(171.37, 312.73), controlPoint1: CGPointMake(170.09, 315.75), controlPoint2: CGPointMake(170.55, 314.12))
        bezierPath.addCurveToPoint(CGPointMake(190.85, 322.61), controlPoint1: CGPointMake(176.03, 318.45), controlPoint2: CGPointMake(183, 322.21))
        bezierPath.addCurveToPoint(CGPointMake(190.61, 320.45), controlPoint1: CGPointMake(190.69, 321.91), controlPoint2: CGPointMake(190.61, 321.19))
        bezierPath.addCurveToPoint(CGPointMake(200.06, 311), controlPoint1: CGPointMake(190.61, 315.23), controlPoint2: CGPointMake(194.84, 311))
        bezierPath.addCurveToPoint(CGPointMake(206.96, 313.98), controlPoint1: CGPointMake(202.78, 311), controlPoint2: CGPointMake(205.24, 312.14))
        bezierPath.addCurveToPoint(CGPointMake(212.97, 311.69), controlPoint1: CGPointMake(209.12, 313.56), controlPoint2: CGPointMake(211.14, 312.77))
        bezierPath.addCurveToPoint(CGPointMake(208.81, 316.92), controlPoint1: CGPointMake(212.26, 313.89), controlPoint2: CGPointMake(210.76, 315.75))
        bezierPath.addCurveToPoint(CGPointMake(214.24, 315.43), controlPoint1: CGPointMake(210.72, 316.69), controlPoint2: CGPointMake(212.54, 316.18))
        bezierPath.addCurveToPoint(CGPointMake(209.52, 320.32), controlPoint1: CGPointMake(212.97, 317.32), controlPoint2: CGPointMake(211.37, 318.99))
        bezierPath.closePath()
        bezierPath.miterLimit = 4;
        return bezierPath.CGPath
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}