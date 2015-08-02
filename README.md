# PQFFillableLoaders

####Collection of completely customizable loaders based in custom `CGPath`s written in Swift

<p align="center">
<img src="Images/waves.gif" height="120px"/>
</p>
<p align="center">
Waves
</p>

<p align="center">
<img src="Images/plain.gif" height="120px"/>
</p>
<p align="center">
Plain
</p>

<p align="center">
<img src="Images/spike.gif" height="120px"/>
</p>
<p align="center">
Spike
</p>

<p align="center">
<img src="Images/rounded.gif" height="120px"/>
</p>
<p align="center">
Rounded
</p>


###Demo:
<p align="center">
<img src="Images/demo.png" height="300px"/>
</p>

###RoadMap:

- [ ] CocoaPods support
- [ ] Carthage support
- [ ] Progress based animations

###Quick Start:
#### - Creation
There are two main methods to create the loaders:

`showLoaderWithPath:` and `createLoaderWithPath:`

`showLoaderWithPath:` is going to call the create one, and after it, is going to call the `showLoader` method.
So, it is just a helper method to do everything at once.

If you want to create the loader, and not show it at the same moment, you can use `createLoaderWithPath:` to create it, and when you want to show it, just call `showLoader`

Sample code:

```
        var loader = WavesLoader.createLoaderWithPath(path)
        loader.loaderColor = UIColor.redColor()
        ...
        //Do other stuff
        ...
        loader.showLoader()
```

#### - Deletion:
Just call the method `removeLoader` and the loader will disappear and will also be removed from its superview.

Sample code:

```
        loader.removeLoader()
```

### Customization:

Apart from being able to customize the loader shape, you can also customize other properties of the loader. Take a look at the list:

- __backgroundColor__: UIColor?         
Background of the loader view (transparent by default)
- __loaderColor__: UIColor?             
Color of the filled loader
- __loaderBackgroundColor__: UIColor?   
Color of the unfilled loader
- __loaderStrokeColor__: UIColor?       
Color of the path stroke
- __loaderStrokeWidth__: CGFloat        
Width of the path stroke
- __loaderAlpha__: CGFloat              
Alpha of the loader view (1.0 by default)
- __cornerRadius__: CGFloat             
Corner radius of the loader view (0.0 by default)
- __duration__: NSTimeInterval          
Duration of the animations (10.0 by default)
- __rectSize__: CGFloat                 
Height of the loader view
- __swing__: Bool                       
Bool to indicate if the view has to swing when going up (small rotation, not available for the Plain loader)

#####Extra property for `Spikes` and `Rounded` loaders:

- __-spikeHeight__: CGFloat              //Height of the spike


###Installation:
####• CocoaPods
####• Carthage

###How to create my own CGPath?

####• Manually

```
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, 0, height/2)
        CGPathAddLineToPoint(path, nil, width + 100, height/2)
        CGPathAddLineToPoint(path, nil, width + 100, height*2)
        CGPathAddLineToPoint(path, nil, 0, height*2)
        CGPathCloseSubpath(path)
        return path
```

####• PaintCode

__[PaintCode](http://www.paintcodeapp.com)__ is a realy powerful Mac app that can do a lot of things. 
You can just draw things, and it will __automagically__ create the code for you

In this case we can use it to create BezierPaths, and extract from there the CGPath.

In the case of drawing a star, it is going to give us this code:

```
//// Star Drawing
var starPath = UIBezierPath()
starPath.moveToPoint(CGPointMake(180, 25))
starPath.addLineToPoint(CGPointMake(195.16, 43.53))
starPath.addLineToPoint(CGPointMake(220.9, 49.88))
starPath.addLineToPoint(CGPointMake(204.54, 67.67))
starPath.addLineToPoint(CGPointMake(205.27, 90.12))
starPath.addLineToPoint(CGPointMake(180, 82.6))
starPath.addLineToPoint(CGPointMake(154.73, 90.12))
starPath.addLineToPoint(CGPointMake(155.46, 67.67))
starPath.addLineToPoint(CGPointMake(139.1, 49.88))
starPath.addLineToPoint(CGPointMake(164.84, 43.53))
starPath.closePath()
UIColor.grayColor().setFill()
starPath.fill()

```

The only thing we have to do here is extract the CGPath from the UIBezierPath like so:

```
let myPath = starPath.CGPath
var myLoader = WavesLoader.showLoaderWithPath(myPath)
```

####• SVG + PaintCode

A feature that I `LOVE` from PaintCode is that you can import an .svg file, and it is going to create the code to create its BezierPath. Completely awesome.

That's how I did the Github and Twitter logos, for example.

###Licenses
All source code is licensed under the MIT License.

If you use it, i'll be happy to know about it.

### Pol Quintana - [@poolqf](https://twitter.com/poolqf)
