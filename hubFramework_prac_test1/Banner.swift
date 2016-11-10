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
     @IBOutlet weak var imageView: UIImageView!
     @IBOutlet weak var imageView: UIImageView!
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var imageView: UIImageView!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "Banner", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    func giveMeHeight()-> Double{
        return Double(self.label.frame.size.height + self.imageView.frame.size.height + 37)
    }
}
