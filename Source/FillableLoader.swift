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
    internal var oldYPoint: CGFloat = 0
    internal let mainBgColor = UIColor(white: 0.2, alpha: 0.6)
    internal weak var loaderSuperview: UIView?
    
    // MARK: Public Variables
    
    /// Duration of the animation (Default:  10.0)
    public var duration: NSTimeInterval = 10.0
    
    /// Loader background height (Default:  ScreenHeight/6 + 30)
    public var rectSize: CGFloat = UIScreen.mainScreen().bounds.height/6 + 30
    
    /// A Boolean value that determines whether the loader should have a swing effect while going up (Default: true)
    public var swing: Bool = true
    
    /// A Boolean value that determines whether the loader movement is progress based or not (Default: false)
    public var progressBased: Bool = false
    
    
    // MARK: Custom Getters and Setters
    
    internal var _backgroundColor: UIColor?
    internal var _loaderColor: UIColor?
    internal var _loaderBackgroundColor: UIColor?
    internal var _loaderStrokeColor: UIColor?
    internal var _loaderStrokeWidth: CGFloat = 0.5
    internal var _loaderAlpha: CGFloat = 1.0
    internal var _cornerRadius: CGFloat = 0.0
    internal var _progress: CGFloat = 0.0
    
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

    /// Loader fill progress from 0.0 to 1.0 . It will automatically fire an animation to update the loader fill progress (Default: 0.0)
    public var progress: CGFloat {
        get { return _progress }
        set {
            if (!progressBased || newValue > 1.0 || newValue < 0.0) { return }
            _progress = newValue
            applyProgress()
        }
    }
    
    
    // MARK: Initializers Methods

    /**
    Creates and SHOWS a loader with the given path
    
    :param: path Loader CGPath
    
    :returns: The loader that's already being showed
    */
    public static func showLoaderWithPath(path: CGPath, onView: UIView? = nil) -> Self {
        let loader = createLoaderWithPath(path: path, onView: onView)
        loader.showLoader()
        return loader
    }
    /**
    Creates and SHOWS a progress based loader with the given path
    
    :param: path Loader CGPath
    
    :returns: The loader that's already being showed
    */
    public static func showProgressBasedLoaderWithPath(path: CGPath, onView: UIView? = nil) -> Self {
    let loader = createProgressBasedLoaderWithPath(path: path, onView: onView)
        loader.showLoader()
        return loader
    }
    
    /**
    Creates a loader with the given path
    
    :param: path Loader CGPath
    
    :returns: The created loader
    */
    public static func createLoaderWithPath(path thePath: CGPath, onView: UIView? = nil) -> Self {
        let loader = self.init()
        loader.initialSetup(onView)
        loader.addPath(thePath)
        return loader
    }
    
    /**
    Creates a progress based loader with the given path
    
    :param: path Loader CGPath
    
    :returns: The created loader
    */
    public static func createProgressBasedLoaderWithPath(path thePath: CGPath, onView: UIView? = nil) -> Self {
        let loader = self.init()
        loader.progressBased = true
        loader.initialSetup(onView)
        loader.addPath(thePath)
        return loader
    }
    
    internal func initialSetup(view: UIView? = nil) {
        //Setting up frame
        var window = view
        if view == nil, let mainWindow = UIApplication.sharedApplication().delegate?.window {
            window = mainWindow
        }
        guard let w = window else { return }
        self.frame = w.frame
        self.center = CGPointMake(CGRectGetMidX(w.bounds), CGRectGetMidY(w.bounds))
        w.addSubview(self)
        loaderSuperview = w
        
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
        assert(width <= loaderView.frame.width, "The width(\(width)) of the path has to fit the dimensions (Height: \(loaderView.frame.width) Width: \(frame.width))")
        var transformation = CGAffineTransformMakeTranslation(-center.x - width/2 + loaderView.frame.width/2, -center.y - height/2 + loaderView.frame.height/2)
        path = CGPathCreateCopyByTransformingPath(thePath, &transformation)
    }
    
    
    // MARK: Prepare Loader
    
    /**
    Shows the loader.
    
    Atention: do not use this method after creating a loader with `showLoaderWithPath(path:)`
    */
    public func showLoader() {
        alpha = 1.0
        hidden = false
        animate = true
        generateLoader()
        startAnimating()
        if superview == nil {
            loaderSuperview?.addSubview(self)
        }
    }
    
    /**
    Stops loader animations and removes it from its superview
    */
    public func removeLoader(animated: Bool = true) {
        let completion: () -> () = {
            self.hidden = false
            self.animate = false
            self.removeFromSuperview()
            self.layer.removeAllAnimations()
            self.shapeLayer.removeAllAnimations()
        }
        
        guard animated else {
            completion()
            return
        }
        
        UIView.animateKeyframesWithDuration(0.2,
            delay: 0,
            options: .BeginFromCurrentState,
            animations: {
                self.alpha = 0.0
            }) { _ in
                completion()
        }
    }
    
    internal func layoutPath() {
        let maskingLayer = CAShapeLayer()
        maskingLayer.frame = loaderView.bounds
        maskingLayer.path = path
        
        strokeLayer = CAShapeLayer()
        strokeLayer.frame = loaderView.bounds
        strokeLayer.path = path
        strokeLayer.strokeColor = loaderStrokeColor?.CGColor
        strokeLayer.lineWidth = loaderStrokeWidth
        strokeLayer.fillColor = loaderBackgroundColor?.CGColor
        loaderView.layer.addSublayer(strokeLayer)
        
        let baseLayer = CAShapeLayer()
        baseLayer.frame = loaderView.bounds
        baseLayer.mask = maskingLayer
        
        shapeLayer.fillColor = loaderColor?.CGColor
        shapeLayer.lineWidth = 0.2
        shapeLayer.strokeColor = UIColor.blackColor().CGColor
        shapeLayer.frame = loaderView.bounds
        oldYPoint = rectSize + extraHeight
        shapeLayer.position = CGPoint(x: shapeLayer.position.x, y: oldYPoint)
        
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
    
    internal func startMoving(up up: Bool) {
        if (progressBased) { return }
        let key = up ? "up" : "down"
        let moveAnimation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position.y")
        moveAnimation.values = up ? [loaderView.frame.height/2 + rectSize/2, loaderView.frame.height/2 - rectSize/2 - extraHeight] : [loaderView.frame.height/2 - rectSize/2 - extraHeight, loaderView.frame.height/2 + rectSize/2]
        moveAnimation.duration = duration
        moveAnimation.removedOnCompletion = false
        moveAnimation.fillMode = kCAFillModeForwards
        moveAnimation.delegate = self
        moveAnimation.setValue(key, forKey: "animation")
        shapeLayer.addAnimation(moveAnimation, forKey: key)
    }
    
    internal func applyProgress() {
        let yPoint = (rectSize + extraHeight)*(1-progress)
        let progressAnimation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position.y")
        progressAnimation.values = [oldYPoint, yPoint]
        progressAnimation.duration = 0.2
        progressAnimation.removedOnCompletion = false
        progressAnimation.fillMode = kCAFillModeForwards
        shapeLayer.addAnimation(progressAnimation, forKey: "progress")
        oldYPoint = yPoint
    }

    internal func startswinging() {
        let swingAnimation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        swingAnimation.values = [0, randomAngle(), -randomAngle(), randomAngle(), -randomAngle(), randomAngle(), 0]
        swingAnimation.duration = 12.0
        swingAnimation.removedOnCompletion = false
        swingAnimation.fillMode = kCAFillModeForwards
        swingAnimation.delegate = self
        swingAnimation.setValue("rotation", forKey: "animation")
        shapeLayer.addAnimation(swingAnimation, forKey: "rotation")
    }
    
    internal func randomAngle() -> Double {
        return M_PI_4/(Double(arc4random_uniform(16)) + 8)
    }
    
    
    //MARK: Abstract methods
    
    internal func generateLoader() {
        preconditionFailure("Call this method from the desired FillableLoader type class")
    }
    
    internal func startAnimating() {
        preconditionFailure("Call this method from the desired FillableLoader type class")
    }
}