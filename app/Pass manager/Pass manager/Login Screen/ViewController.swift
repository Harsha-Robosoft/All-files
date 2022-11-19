//
//  ViewController.swift
//  Pass manager
//
//  Created by Harsha R Mundaragi on 17/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentOutLet: UISegmentedControl!
    
    @IBOutlet weak var signInSegment: UIView!
    
    @IBOutlet weak var signUpSegment: UIView!
    
    @IBOutlet weak var logo: UIImageView!
    
    let layer = CAGradientLayer()
    
    var views: [UIView] = []
    
    var counter = 0
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        layer.frame = view.bounds

        layer.colors = [UIColor(red: 32/255, green: 187/255, blue: 255/255, alpha: 1.0).cgColor, UIColor(red: 14/255, green: 133/255, blue: 255/255, alpha: 1.0).cgColor]

        layer.startPoint = CGPoint(x : 0, y : 0)

        layer.endPoint = CGPoint(x :1, y: 1)

        view.layer.addSublayer(layer)
        
        view.bringSubviewToFront(logo)
        
        view.bringSubviewToFront(segmentOutLet)
        
        self.view.bringSubviewToFront(signInSegment)
        
        navigationController?.navigationBar.isHidden = true

        segmentOutLet.addUnderlineForSelectedSegment()
        
        segmentOutLet.changeUnderlinePosition()
                
        let titleText = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16.0)]
        
        segmentOutLet.setTitleTextAttributes(titleText, for: .normal)

        segmentOutLet.setTitleTextAttributes(titleText, for: .selected)
        
        views = [signInSegment,signUpSegment]
        
        segmentOutLet.selectedSegmentIndex = counter
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handelGestures(gestures:)))
        
        swipeLeft.direction = .left
        
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handelGestures(gestures:)))
        
        swipeRight.direction = .right
        
        self.view.addGestureRecognizer(swipeRight)
        
        
    }
    
    @objc func handelGestures(gestures: UISwipeGestureRecognizer){
                              
        if counter>=0 && counter < views.count{
            
            if gestures.direction == UISwipeGestureRecognizer.Direction.right{
                
                if counter != 0 {
                    
                    counter = counter - 1
                    
                    signInSegment.isHidden = false

                    self.view.bringSubviewToFront(views[counter])
                    
                     segmentOutLet.changeUnderlinePosition()

                    signUpSegment.isHidden = true

                    segmentOutLet.selectedSegmentIndex = counter
                }
                
            }
            
            if gestures.direction == UISwipeGestureRecognizer.Direction.left{
                
                if counter != views.count - 1 {
                    
                    counter = counter + 1
                    
                    signUpSegment.isHidden = false

                    self.view.bringSubviewToFront(views[counter])

                    segmentOutLet.changeUnderlinePosition()
                    
                    signInSegment.isHidden = true

                    segmentOutLet.selectedSegmentIndex = counter
                    
                }
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let destination = segue.destination as? SignUpViewController {
            destination.delegate = self
        }
    }
    

    override func viewWillLayoutSubviews() {

        super.viewWillLayoutSubviews()

        self.layer.frame = self.view.bounds

    }
    
    @IBAction func segmentOutLet(_ sender: UISegmentedControl) {
        
        segmentOutLet.changeUnderlinePosition()
        
        switch sender.selectedSegmentIndex{
        
        case 0:
            
            signInSegment.isHidden = false
            
            self.view.bringSubviewToFront(signInSegment)
            
            signUpSegment.isHidden = true
            
        case 1:
            
            signUpSegment.isHidden = false
            
            self.view.bringSubviewToFront(signUpSegment)
            
            signInSegment.isHidden = true

        default:
            
            break
            
        }
    }
    
    
}

extension ViewController: SendAction{
    
}
