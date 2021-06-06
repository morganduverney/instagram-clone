//
//  Extensions.swift
//  InstagramClone
//
//  Created by Morgan Duverney on 6/5/21.
//

import Foundation
import UIKit

extension UIView {
    // Frame shorthand
    var top: CGFloat {
        frame.origin.y
    }
    var bottom: CGFloat {
        frame.origin.y+height
    }
    var left: CGFloat {
        frame.origin.x
    }
    var right: CGFloat {
        frame.origin.x+width
    }
    var width: CGFloat {
        frame.size.width
    }
    var height: CGFloat {
        frame.size.height
    }
}
