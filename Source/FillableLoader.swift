//
//  FillableLoader.swift
//  PQFFillableLoaders
//
//  Created by Pol Quintana on 25/7/15.
//  Copyright (c) 2015 Pol Quintana. All rights reserved.
//

import UIKit

public class FillableLoader: UIView {
    internal var shapeLayer = CAShapeLayer()
    internal var strokeLayer = CAShapeLayer()
    internal var path: CGPath!
    internal var loaderView = UIView()
    internal var animate: Bool = false
    internal var extraHeight: CGFloat = 0
    internal let mainBgColor = UIColor(white: 0.2, alpha: 0.6)
    
    
    // MARK: Public Variables
    
    /// Duration of the animation (Default:  10.0)
    public var duration: NSTimeInterval = 10.0
    
    /// Loader background height (Default:  ScreenHeight/6 + 30)
    public var rectSize: CGFloat = UIScreen.mainScreen().bounds.height/6 + 30
    
    /// Swing effect while going up (Default: true)
    public var swing: Bool = true
    
    
    // MARK: Custom Getters and Setters
    
    internal var _backgroundColor: UIColor?
    internal var _loaderColor: UIColor?
    internal var _loaderBackgroundColor: UIColor?
    internal var _loaderStrokeColor: UIColor?
    internal var _loaderStrokeWidth: CGFloat = 0.5
    internal var _loaderAlpha: CGFloat = 1.0
    internal var _cornerRadius: CGFloat = 0.0
    
    /// Loader view background color (Default: Clear)
    override public var backgroundColor: UIColor? {
        get { return _backgroundColor }
        set {
            super.backgroundColor = mainBgColor
            _backgroundColor = newValue
            loaderView.backgroundColor = newValue
            loaderView.layer.backgroundColor = newValue?.CGColor
        }
    }
    
    /// Filled loader color (Default: Blue)
    public var loaderColor: UIColor? {
        get { return _loaderColor }
        set {
            _loaderColor = newValue
            shapeLayer.fillColor = newValue?.CGColor
        }
    }
    
    /// Unfilled loader color (Default: White)
    public var loaderBackgroundColor: UIColor? {
        get { return _loaderBackgroundColor }
        set {
            _loaderBackgroundColor = newValue
            strokeLayer.fillColor = newValue?.CGColor
        }
    }
    
    /// Loader outline line color (Default: Black)
    public var loaderStrokeColor: UIColor? {
        get { return _loaderStrokeColor }
        set {
            _loaderStrokeColor = newValue
            strokeLayer.strokeColor = newValue?.CGColor
        }
    }
    
    /// Loader outline line width (Default: 0.5)
    public var loaderStrokeWidth: CGFloat {
        get { return _loaderStrokeWidth }
        set {
            _loaderStrokeWidth = newValue
            strokeLayer.lineWidth = newValue
        }
    }
    
    /// Loader view alpha (Default: 1.0)
    public var loaderAlpha: CGFloat {
        get { return _loaderAlpha }
        set {
            _loaderAlpha = newValue
            loaderView.alpha = newValue
        }
    }
    
    /// Loader view corner radius (Default: 0.0)
    public var cornerRadius: CGFloat {
        get { return _cornerRadius }
        set {
            _cornerRadius = newValue
            loaderView.layer.cornerRadius = newValue
        }
    }
    
    
    // MARK: Initializers Methods

    /**
    Creates and SHOWS a loader with the given path
    
    :param: path Loader CGPath
    
    :returns: The loader that's already being showed
    */
    public static func showLoaderWithPath(path: CGPath) -> Self {
        let loader = createLoaderWithPath(path: path)
        loader.showLoader()
        return loader
    }
    
    /**
    Creates a loder with the given path
    
    :param: path Loader CGPath
    
    :returns: The created loader
    */
    public static func createLoaderWithPath(path thePath: CGPath) -> Self {
        var loader = self.init()
        loader.initialSetup()
        loader.addPath(thePath)
        return loader
    }
    
    internal func initialSetup() {
        //Setting up frame
        let window = UIApplication.sharedApplication().delegate?.window!
        self.frame = window!.frame
        self.center = CGPointMake(CGRectGetMidX(window!.bounds), CGRectGetMidY(window!.bounds))
        window!.addSubview(self)
        
        //Initial Values
        defaultValues()
        
        //Setting up loaderView
        loaderView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.width, rectSize)
        loaderView.center = CGPointMake(CGRectGetWidth(frame)/2, CGRectGetHeight(frame)/2)
        loaderView.layer.cornerRadius = cornerRadius
        
        //Add loader to its superview
        
        self.addSubview(loaderView)
        
        //Initially hidden
        hidden = true
    }
    
    internal func addPath(thePath: CGPath) {
        let bounds = CGPathGetBoundingBox(thePath)
        let center = bounds.origin
        let height = bounds.height
        let width = bounds.width
        assert(height <= loaderView.frame.height, "The height(\(height)) of the path has to fit the dimensions (Height: \(loaderView.frame.height) Width: \(frame.width))")
        assert(width <= loaderView.frame.height, "The width(\(width)) of the path has to fit the dimensions (Height: \(loaderView.frame.width) Width: \(frame.width))")
        var transformation = CGAffineTransformMakeTranslation(-center.x - width/2 + loaderView.frame.width/2, -center.y - height/2 + loaderView.frame.height/2)
        path = CGPathCreateCopyByTransformingPath(thePath, &transformation)
    }
    
    
    // MARK: Prepare Loader
    
    /**
    Shows the loader.
    
    Atention: do not use this method after creating a loader with `showLoaderWithPath(path:)`
    */
    public func showLoader() {
        hidden = false
        animate = true
        generateLoader()
        startAnimating()
    }
    
    /**
    Stops loader animations and removes it from its superview
    */
    public func removeLoader() {
        hidden = false
        animate = false
        removeFromSuperview()
    }
    
    internal func layoutPath() {
        var maskingLayer = CAShapeLayer()
        maskingLayer.frame = loaderView.bounds
        maskingLayer.path = path
        
        strokeLayer = CAShapeLayer()
        strokeLayer.frame = loaderView.bounds
        strokeLayer.path = path
        strokeLayer.strokeColor = loaderStrokeColor?.CGColor
        strokeLayer.lineWidth = loaderStrokeWidth
        strokeLayer.fillColor = loaderBackgroundColor?.CGColor
        loaderView.layer.addSublayer(strokeLayer)
        
        var baseLayer = CAShapeLayer()
        baseLayer.frame = loaderView.bounds
        baseLayer.mask = maskingLayer
        
        shapeLayer.fillColor = loaderColor?.CGColor
        shapeLayer.lineWidth = 0.2
        shapeLayer.strokeColor = UIColor.blackColor().CGColor
        shapeLayer.frame = loaderView.bounds
        
        loaderView.layer.addSublayer(baseLayer)
        baseLayer.addSublayer(shapeLayer)
    }

    internal func defaultValues() {
        duration = 10.0
        backgroundColor = UIColor.clearColor()
        loaderColor = UIColor(red: 0.41, green: 0.728, blue: 0.892, alpha: 1.0)
        loaderBackgroundColor = UIColor.whiteColor()
        loaderStrokeColor = UIColor.blackColor()
        loaderStrokeWidth = 0.5
        loaderAlpha = 1.0
        cornerRadius = 0.0
    }
    
    
    //MARK: Animations
    
    internal func startMoving(up: Bool) {
        let key = up ? "up" : "down"
        let animation2: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position.y")
        animation2.values = up ? [loaderView.frame.height/2 + rectSize/2, loaderView.frame.height/2 - rectSize/2 - extraHeight] : [loaderView.frame.height/2 - rectSize/2 - extraHeight, loaderView.frame.height/2 + rectSize/2]
        animation2.duration = duration
        animation2.removedOnCompletion = false
        animation2.fillMode = kCAFillModeForwards
        animation2.delegate = self
        animation2.setValue(key, forKey: "animation")
        shapeLayer.addAnimation(animation2, forKey: key)
    }
    
    internal func startswinging() {
        let animation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        animation.values = [0, randomAngle(), -randomAngle(), randomAngle(), -randomAngle(), randomAngle(), 0]
        animation.duration = 12.0
        animation.removedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.delegate = self
        animation.setValue("rotation", forKey: "animation")
        shapeLayer.addAnimation(animation, forKey: "rotation")
    }
    
    internal func randomAngle() -> Double {
        return M_PI_4/(Double(arc4random_uniform(16)) + 8)
    }
    
    
    //MARK: Abstract methods
    
    internal func generateLoader() {
        preconditionFailure("This method must be overridden")
    }
    
    internal func startAnimating() {
        preconditionFailure("This method must be overridden")
    }
}