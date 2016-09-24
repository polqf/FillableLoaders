//
//  ViewController.swift
//  FillableLoaders
//
//  Created by Pol Quintana on 2/8/15.
//  Copyright (c) 2015 Pol Quintana. All rights reserved.
//

import UIKit
import FillableLoaders

class ViewController: UIViewController {
    
    var segmentedControl: UISegmentedControl = UISegmentedControl()
    var button: UIButton = UIButton()
    var loader: FillableLoader = FillableLoader()
    var firstLogo: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loader = PlainLoader.showLoader(with: path())
        setupSubviews()
    }
    
    func setupSubviews() {
//        let imageView = UIImageView(image: UIImage(named: "bg.png"))
//        imageView.frame = view.frame
//        view.addSubview(imageView)

        let margin: CGFloat = 30
        let width: CGFloat = view.frame.width
        let height: CGFloat = view.frame.height
        let window = UIApplication.shared.delegate?.window!
        let items = ["Waves", "Plain", "Spike", "Rounded"]
        segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layer.cornerRadius = 5.0
        segmentedControl.backgroundColor = UIColor.white
        segmentedControl.tintColor = UIColor(white: 0.2, alpha: 1)
        segmentedControl.frame = CGRect(x: margin, y: height - margin - 40, width: width - margin*2, height: 40)
        segmentedControl.addTarget(self, action: #selector(segmentedControlTouch), for: .valueChanged)
        window!.addSubview(segmentedControl)
        
        button.frame = CGRect(x: 0, y: 0, width: 150, height: 35)
        button.center = CGPoint(x: view.frame.width/2, y: view.frame.height - 2*margin - 35)
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 5.0
        button.setTitle("Change Logo", for: UIControlState())
        button.setTitleColor(UIColor.black, for: UIControlState())
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(changeLogo), for: .touchUpInside)
        window!.addSubview(button)
    }
    
    func segmentedControlTouch(_ sender: UISegmentedControl) {
        presentFillableLoader(at: sender.selectedSegmentIndex)
    }
    
    func changeLogo() {
        firstLogo = !firstLogo
        presentFillableLoader(at: segmentedControl.selectedSegmentIndex)
    }
    
    func presentFillableLoader(at index: Int) {
        loader.removeLoader(false)
        switch index {
        case 1:
            loader = PlainLoader.showLoader(with: path())
        case 2:
            loader = SpikeLoader.showLoader(with: path())
        case 3:
            loader = RoundedLoader.showLoader(with: path())
        default:
            loader = WavesLoader.showLoader(with: path())
        }
        let window = UIApplication.shared.delegate?.window!
        window!.bringSubview(toFront: segmentedControl)
        window!.bringSubview(toFront: button)
    }
    
    func path() -> CGPath{
        return firstLogo ? Paths.twitterPath() : Paths.githubPath()
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
}
