//
//  Storyboarded.swift
//  Coordinator
//
//  Created by Kaue Ludovico on 23/02/2020.
//  Copyright © 2020 Kaue Ludovico. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        // This pull out "MyAppName.MyViewController"
        let fullName = NSStringFromClass(self)
        
        // This splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]
        
        // Load our Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        /*
         Instantiate a ViewController with that identifier,
        and force cast as the type that was requested
        */
        
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
