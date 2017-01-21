//
//  ToastView.swift
//  ProtocolDelegateTester
//
//  Created by Calkins, Bill on 1/19/17.
//  Copyright © 2017 Calkins Computer Consulting. All rights reserved.
//

import UIKit

class ToastView: UIView {
    
    var displayText: String? {
        didSet {
            if let toastLabel = self.displayLabel {
                toastLabel.text = displayText
            }
        }
    }
    private var displayLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init?(toastYPosition: CGFloat, toastWidth: CGFloat) {
        self.init(frame: CGRect(x: 0.0, y: toastYPosition, width: toastWidth, height: 40.0))
        self.backgroundColor = UIColor(red: 108.0/255, green: 155.0/255, blue: 0, alpha: 1.0)
        self.displayLabel = UILabel(frame: CGRect(x: 35.0, y: 10.0, width: toastWidth - 20, height: 20.0))
        self.displayLabel?.textColor = UIColor.white
        self.addSubview(self.displayLabel!)
        
        if let checkMarkImage = UIImage(named: "CheckMark") {
            let checkMarkView = UIImageView(frame: CGRect(x: 5.0, y: 10.0, width: 20.0, height: 20.0))
            checkMarkView.image = checkMarkImage
            self.addSubview(checkMarkView)
        }
    }


}
