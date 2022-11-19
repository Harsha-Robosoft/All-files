//
//  UnderLine.swift
//  Pass manager
//
//  Created by Harsha R Mundaragi on 07/11/22.
//

import Foundation

import UIKit

extension UISegmentedControl{

    func removeBorder(){

        let backgroundImage = UIImage.getColoredRectImageWith(color: UIColor.clear.cgColor, andSize: self.bounds.size)

        self.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)

        self.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)

        self.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)

        let deviderImage = UIImage.getColoredRectImageWith(color: UIColor.clear.cgColor, andSize: CGSize(width: 1.0, height: self.bounds.size.height))

        self.setDividerImage(deviderImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)

        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)

        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 67/255, green: 129/255, blue: 244/255, alpha: 1.0)], for: .selected)

    }



    func addUnderlineForSelectedSegment(){

        removeBorder()

        let underlineWidth: CGFloat = 60

        let underlineHeight: CGFloat = 4.0

        let underlineXPosition = CGFloat(selectedSegmentIndex * Int(underlineWidth) + 30)

        let underLineYPosition = self.bounds.size.height - 7.0

        let underlineFrame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)

        let underline = UIView(frame: underlineFrame)

        underline.backgroundColor = UIColor(red: 255/255, green: 162/255, blue: 34/255, alpha: 1.0)

        underline.tag = 1

        self.addSubview(underline)

    }



    func changeUnderlinePosition(){

        guard let underline = self.viewWithTag(1) else {return}

        let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex) + 48
        
        underline.frame.origin.x = underlineFinalXPosition
        

    }

}



extension UIImage{

    class func getColoredRectImageWith(color: CGColor, andSize size: CGSize) -> UIImage{

        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)

        let graphicsContext = UIGraphicsGetCurrentContext()

        graphicsContext?.setFillColor(color)

        let rectangle = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)

        graphicsContext?.fill(rectangle)

        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return rectangleImage!

    }

}

