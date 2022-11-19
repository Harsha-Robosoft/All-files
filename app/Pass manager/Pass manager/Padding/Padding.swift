//
//  Padding.swift
//  Pass manager
//
//  Created by Harsha R Mundaragi on 07/11/22.
//

import Foundation

import UIKit

extension UITextField {

    func setPaddding() {

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10   ,height: self.frame.height))

        self.leftView = paddingView

        self.leftViewMode = .always

    }

}
