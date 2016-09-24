//
//  FillableLoader.swift
//  PQFFillableLoaders
//
//  Created by Pol Quintana on 25/7/15.
//  Copyright (c) 2015 Pol Quintana. All rights reserved.
//

import UIKit

open class FillableLoader: UIView, CAAnimationDelegate {
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
    open var duration: TimeInterval = 10.0

    /// Loader background height (Default:  ScreenHeight/6 + 30)
    open var rectSize: CGFloat = UIScreen.main.bounds.height/6 + 30

    /// A Boolean value that determines whether the loader should have a swing effect while going up (Default: true)
    open var swing: Bool = true

    /// A Boolean value that determines whether the loader movement is progress based or not (Default: false)
    open var progressBased: Bool = false


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
    override open var backgroundColor: UIColor? {
        get { return _backgroundColor }
        set {
            super.backgroundColor = mainBgColor
            _backgroundColor = newValue
            loaderView.backgroundColor = newValue
            loaderView.layer.backgroundColor = newValue?.cgColor
        }
    }

    /// Filled loader color (Default: Blue)
    open var loaderColor: UIColor? {
        get { return _loaderColor }
        set {
            _loaderColor = newValue
            shapeLayer.fillColor = newValue?.cgColor
        }
    }

    /// Unfilled loader color (Default: White)
    open var loaderBackgroundColor: UIColor? {
        get { return _loaderBackgroundColor }
        set {
            _loaderBackgroundColor = newValue
            strokeLayer.fillColor = newValue?.cgColor
        }
    }

    /// Loader outline line color (Default: Black)
    open var loaderStrokeColor: UIColor? {
        get { return _loaderStrokeColor }
        set {
            _loaderStrokeColor = newValue
            strokeLayer.strokeColor = newValue?.cgColor
        }
    }

    /// Loader outline line width (Default: 0.5)
    open var loaderStrokeWidth: CGFloat {
        get { return _loaderStrokeWidth }
        set {
            _loaderStrokeWidth = newValue
            strokeLayer.lineWidth = newValue
        }
    }

    /// Loader view alpha (Default: 1.0)
    open var loaderAlpha: CGFloat {
        get { return _loaderAlpha }
        set {
            _loaderAlpha = newValue
            loaderView.alpha = newValue
        }
    }

    /// Loader view corner radius (Default: 0.0)
    open var cornerRadius: CGFloat {
        get { return _cornerRadius }
        set {
            _cornerRadius = newValue
            loaderView.layer.cornerRadius = newValue
        }
    }

    /// Loader fill progress from 0.0 to 1.0 . It will automatically fire an animation to update the loader fill progress (Default: 0.0)
    open var progress: CGFloat {
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
    open static func showLoader(with path: CGPath, on view: UIView? = nil) -> Self {
        let loader = createLoader(with: path, on: view)
        loader.showLoader()
        return loader
    }
    /**
     Creates and SHOWS a progress based loader with the given path

     :param: path Loader CGPath

     :returns: The loader that's already being showed
     */
    open static func showProgressBasedLoader(with path: CGPath, on view: UIView? = nil) -> Self {
        let loader = createProgressBasedLoader(with: path, on: view)
        loader.showLoader()
        return loader
    }

    /**
     Creates a loader with the given path

     :param: path Loader CGPath

     :returns: The created loader
     */
    open static func createLoader(with path: CGPath, on view: UIView? = nil) -> Self {
        let loader = self.init()
        loader.initialSetup(on: view)
        loader.add(path)
        return loader
    }

    /**
     Creates a progress based loader with the given path

     :param: path Loader CGPath

     :returns: The created loader
     */
    open static func createProgressBasedLoader(with path: CGPath, on view: UIView? = nil) -> Self {
        let loader = self.init()
        loader.progressBased = true
        loader.initialSetup(on: view)
        loader.add(path)
        return loader
    }

    internal func initialSetup(on view: UIView? = nil) {
        //Setting up frame
        var window = view
        if view == nil, let mainWindow = UIApplication.shared.delegate?.window {
            window = mainWindow
        }
        guard let w = window else { return }
        self.frame = w.frame
        self.center = CGPoint(x: w.bounds.midX, y: w.bounds.midY)
        w.addSubview(self)
        loaderSuperview = w

        //Initial Values
        defaultValues()

        //Setting up loaderView
        loaderView.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: rectSize)
        loaderView.center = CGPoint(x: frame.width/2, y: frame.height/2)
        loaderView.layer.cornerRadius = cornerRadius

        //Add loader to its superview

        self.addSubview(loaderView)

        //Initially hidden
        isHidden = true
    }

    internal func add(_ path: CGPath) {
        let bounds = path.boundingBox
        let center = bounds.origin
        let height = bounds.height
        let width = bounds.width
        assert(height <= loaderView.frame.height, "The height(\(height)) of the path has to fit the dimensions (Height: \(loaderView.frame.height) Width: \(frame.width))")
        assert(width <= loaderView.frame.width, "The width(\(width)) of the path has to fit the dimensions (Height: \(loaderView.frame.width) Width: \(frame.width))")
        var transformation = CGAffineTransform(translationX: -center.x - width/2 + loaderView.frame.width/2, y: -center.y - height/2 + loaderView.frame.height/2)
        self.path = path.copy(using: &transformation)!
    }


    // MARK: Prepare Loader

    /**
     Shows the loader.

     Atention: do not use this method after creating a loader with `showLoaderWithPath(path:)`
     */
    open func showLoader() {
        alpha = 1.0
        isHidden = false
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
    open func removeLoader(_ animated: Bool = true) {
        let completion: () -> () = {
            self.isHidden = false
            self.animate = false
            self.removeFromSuperview()
            self.layer.removeAllAnimations()
            self.shapeLayer.removeAllAnimations()
        }

        guard animated else {
            completion()
            return
        }

        UIView.animateKeyframes(withDuration: 0.2,
                                delay: 0,
                                options: .beginFromCurrentState,
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
        strokeLayer.strokeColor = loaderStrokeColor?.cgColor
        strokeLayer.lineWidth = loaderStrokeWidth
        strokeLayer.fillColor = loaderBackgroundColor?.cgColor
        loaderView.layer.addSublayer(strokeLayer)

        let baseLayer = CAShapeLayer()
        baseLayer.frame = loaderView.bounds
        baseLayer.mask = maskingLayer

        shapeLayer.fillColor = loaderColor?.cgColor
        shapeLayer.lineWidth = 0.2
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.frame = loaderView.bounds
        oldYPoint = rectSize + extraHeight
        shapeLayer.position = CGPoint(x: shapeLayer.position.x, y: oldYPoint)

        loaderView.layer.addSublayer(baseLayer)
        baseLayer.addSublayer(shapeLayer)
    }

    internal func defaultValues() {
        duration = 10.0
        backgroundColor = UIColor.clear
        loaderColor = UIColor(red: 0.41, green: 0.728, blue: 0.892, alpha: 1.0)
        loaderBackgroundColor = UIColor.white
        loaderStrokeColor = UIColor.black
        loaderStrokeWidth = 0.5
        loaderAlpha = 1.0
        cornerRadius = 0.0
    }


    //MARK: Animations

    internal func startMoving(up: Bool) {
        if (progressBased) { return }
        let key = up ? "up" : "down"
        let moveAnimation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position.y")
        moveAnimation.values = up ? [loaderView.frame.height/2 + rectSize/2, loaderView.frame.height/2 - rectSize/2 - extraHeight] : [loaderView.frame.height/2 - rectSize/2 - extraHeight, loaderView.frame.height/2 + rectSize/2]
        moveAnimation.duration = duration
        moveAnimation.isRemovedOnCompletion = false
        moveAnimation.fillMode = kCAFillModeForwards
        moveAnimation.delegate = self
        moveAnimation.setValue(key, forKey: "animation")
        shapeLayer.add(moveAnimation, forKey: key)
    }

    internal func applyProgress() {
        let yPoint = (rectSize + extraHeight)*(1-progress)
        let progressAnimation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position.y")
        progressAnimation.values = [oldYPoint, yPoint]
        progressAnimation.duration = 0.2
        progressAnimation.isRemovedOnCompletion = false
        progressAnimation.fillMode = kCAFillModeForwards
        shapeLayer.add(progressAnimation, forKey: "progress")
        oldYPoint = yPoint
    }

    internal func startswinging() {
        let swingAnimation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        swingAnimation.values = [0, randomAngle(), -randomAngle(), randomAngle(), -randomAngle(), randomAngle(), 0]
        swingAnimation.duration = 12.0
        swingAnimation.isRemovedOnCompletion = false
        swingAnimation.fillMode = kCAFillModeForwards
        swingAnimation.delegate = self
        swingAnimation.setValue("rotation", forKey: "animation")
        shapeLayer.add(swingAnimation, forKey: "rotation")
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
