//
//  SlidingText.swift
//  SlidingText
//
//  Created by Dionisis Karatzas on 19/11/2018.
//

import UIKit

@IBDesignable
class SlidingText : UIView{
    
    private var pageControl : UIPageControl = UIPageControl(frame: CGRect(x: 0,y: 0,width: 50,height: 20))
    private var label : UILabel = UILabel(frame: CGRect(x: 0,y: 0,width: 50,height: 20))
    private var texts : [String] = ["Add your texts seperated by '|n'"]
    
    private(set) var isPaused: Bool = false
    private(set) var currentIndex = 0
    private var timer : Timer?
    
    @IBInspectable var labelColor: UIColor = UIColor.black {
        didSet {
            label.textColor = labelColor
        }
    }
    
    @IBInspectable var labelSize: CGFloat = CGFloat(17.0){
        didSet{
            label.font = UIFont(name: labelFont, size: labelSize)
        }
    }
    @IBInspectable var labelFont: String = "Avenir Next"{
        didSet {
            label.font = UIFont(name: labelFont, size: labelSize)
        }
    }
    
    @IBInspectable var labelTexts: String = "" {
        didSet {
            texts = labelTexts.components(separatedBy: "|n")
            label.text = texts[0]
            pageControl.numberOfPages = texts.count
            
            var i = 0
            // remove leading newline/whitespace characters
            for text in texts {
                let trimmed = text.replacingOccurrences(of: "^\\s*", with: "", options: .regularExpression)
                texts[i] = trimmed
                i+=1
            }
        }
    }
    
    @IBInspectable var pagerTintColor: UIColor = UIColor.black {
        didSet {
            pageControl.pageIndicatorTintColor = self.pagerTintColor
        }
    }
    
    @IBInspectable var pagerCurrentColor: UIColor = UIColor.green {
        didSet {
            pageControl.currentPageIndicatorTintColor = self.pagerCurrentColor
        }
    }
    
    
    
    @IBInspectable var timeToSlide: Double = 4.0 {
        didSet {
            timer?.invalidate()
            startOrResumeTimer()
        }
    }
    
    @IBInspectable var enableGestures: Bool = false {
        didSet {
            if enableGestures{
                configureGestures()
            }
            else{
                self.gestureRecognizers?.forEach(self.removeGestureRecognizer)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureLabel()
        configurePageControl()
        startOrResumeTimer()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
        configurePageControl()
        startOrResumeTimer()
    }
    
    private func configureGestures(){
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.addGestureRecognizer(swipeLeft)
    }
    
    private func configureLabel() {
        label.text = texts[0]
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont(name: labelFont, size: labelSize)
        
        self.addSubview(label)
        
        let horizontalConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 10)
        let trailingConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.trailingMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: label, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.leadingMargin, multiplier: 1, constant: 0)
        
        
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, trailingConstraint, leadingConstraint])
    }
    
    private func configurePageControl() {
        pageControl.numberOfPages = 1
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = pagerTintColor
        pageControl.currentPageIndicatorTintColor = pagerCurrentColor
        
        pageControl.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(pageControl)
        
        let horizontalConstraint = NSLayoutConstraint(item: pageControl, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: pageControl, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 10)
        
        
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
    }
    
    public func pause(){
        timer?.invalidate()
        isPaused = true
    }
    
    public func start(){
        startOrResumeTimer()
    }
    
    public var slidingTexts: [String]{
        get{
            return texts
        }
        set{
            texts = newValue
            label.text = texts[0]
            pageControl.numberOfPages = texts.count
            
            var i = 0
            // remove leading newline/whitespace characters
            for text in texts {
                let trimmed = text.replacingOccurrences(of: "^\\s*", with: "", options: .regularExpression)
                texts[i] = trimmed
                i+=1
            }
        }
    }
    
    
    private func startOrResumeTimer() {
        timer =  Timer.scheduledTimer(timeInterval: timeToSlide, target: self, selector: #selector(self.timersJob), userInfo: nil, repeats: true)
        isPaused = false
        
    }
    
    @objc private func timersJob(){
        self.currentIndex += 1
        if self.currentIndex == self.texts.count{
            self.currentIndex = 0
        }
        
        self.label.pushTransition(duration: 0.5, animationSubType: convertFromCATransitionSubtype(CATransitionSubtype.fromRight))
        self.label.text = self.texts[self.currentIndex]
        
        self.pageControl.currentPage = self.currentIndex
    }
    
    @objc private func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                timer?.invalidate()
                currentIndex -= 1
                if currentIndex < 0{
                    currentIndex = texts.count - 1
                }
                
                label.pushTransition(duration: 0.5, animationSubType: convertFromCATransitionSubtype(CATransitionSubtype.fromLeft))
                label.text = self.texts[currentIndex]
                
                pageControl.currentPage = currentIndex
                startOrResumeTimer()
            case UISwipeGestureRecognizer.Direction.down:
                break
            case UISwipeGestureRecognizer.Direction.left:
                timer?.invalidate()
                currentIndex += 1
                if currentIndex == texts.count{
                    currentIndex = 0
                }
                
                label.pushTransition(duration: 0.5, animationSubType: convertFromCATransitionSubtype(CATransitionSubtype.fromRight))
                label.text = self.texts[currentIndex]
                
                pageControl.currentPage = self.currentIndex
                startOrResumeTimer()
            case UISwipeGestureRecognizer.Direction.up:
                break
            default:
                break
            }
        }
    }
}

extension UIView {
    func pushTransition(duration:CFTimeInterval, animationSubType: String) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.push
        animation.subtype = convertToOptionalCATransitionSubtype(animationSubType)
        animation.duration = duration
        self.layer.add(animation, forKey: convertFromCATransitionType(CATransitionType.push))
    }
}

fileprivate func convertFromCATransitionSubtype(_ input: CATransitionSubtype) -> String {
	return input.rawValue
}

fileprivate func convertToOptionalCATransitionSubtype(_ input: String?) -> CATransitionSubtype? {
	guard let input = input else { return nil }
	return CATransitionSubtype(rawValue: input)
}

fileprivate func convertFromCATransitionType(_ input: CATransitionType) -> String {
	return input.rawValue
}
