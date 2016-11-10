//
//  Banner.swift
//  hubFramework_prac_test1
//
//  Created by Anant on 11/9/16.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit

class Banner: UIView {

    @IBOutlet weak var label: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "Banner", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

}
