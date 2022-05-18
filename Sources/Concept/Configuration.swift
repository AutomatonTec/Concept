//
//  Configuration.swift
//  
//
//  Created by Mark Morrill on 2022/05/17.
//

import Foundation
import UIKit

@objc public class Configuration : NSObject {
    let oddColor: UIColor
    let evenColor: UIColor

    @objc public init(oddColor odd: UIColor, evenColor even: UIColor) {
        oddColor = odd
        evenColor = even
        super.init()
    }
}

