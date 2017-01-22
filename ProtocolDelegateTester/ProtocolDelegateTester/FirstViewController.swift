//
//  FirstViewController.swift
//  ProtocolDelegateTester
//
//  Created by William Calkins on 10/6/16.
//  Copyright © 2016 Calkins Computer Consulting. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var apiInteractionStarted: Bool = false
    var apiInteractionStop: Bool = false
    var apiDataMapped: Bool = false
    
    var apiDataReturnData: [afiModel]? {
        didSet {
            //self.reloadData()
            print("in apiDataReturnData = \(self.apiDataReturnData)")
        }
        willSet {
            
        }
    }
    
    var policyDataAccess = PolicyDAO(environment: "dev")
    
    override func viewDidLoad() {
        
        self.policyDataAccess.delegate = self
        
        do {
            try self.policyDataAccess.getData()
        } catch {
            print("there was an error")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.layer.backgroundColor = UIColor(colorLiteralRed: 224.0, green: 235.0, blue: 235.0, alpha: 1.0).cgColor
        //self.view.backgroundColor = UIColor.gray
        self.view.layer.opacity = 0.85
    }
    
    
    func apiDataReturn() -> [afiModel] {
        let policy1 = Policy()
        
        return [policy1]
    }
    
    func reloadData() {
        if let apiRetData = self.apiDataReturnData {
            for policy in apiRetData {
                print(policy.toString())
            }
        }
        
    }
    
    
    @IBAction func pushMeAction(_ sender: AnyObject) {
        print("pushMeAction")
        self.performSegue(withIdentifier: (self.title == "SecondInStack" ? "SecondSegue" : "TestSegue" ), sender: self)
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print("shouldPerformSegue")
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare")
    }
    
    @IBAction func showToast(_ sender: Any) {
        
        if let toastView = ToastView(toastYPosition: self.view.frame.height - 100, toastWidth: self.view.frame.width) {
            toastView.displayText = "Your password has been changed"
            toastView.translatesAutoresizingMaskIntoConstraints = false
            
            //Add the toast view 
            self.view.addSubview(toastView)
            
            delay(seconds: 3.0, completion: {
                UIView.transition(with: toastView, duration: 0.6, options: [.curveEaseIn], animations: {
                    self.view.addSubview(toastView)
                    
                }, completion: { (result) in
                    toastView.removeFromSuperview()
                })
            })
            
        }
    }
    
    func showItem(_ index: Int) {
        //show the selected image
        let imageView  = UIImageView(image: UIImage(named: "summericons_100px_0\(index).png"))
        imageView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
        imageView.layer.cornerRadius = 5.0
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(imageView)
        
        let conX = imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let conBottom = imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: imageView.frame.height)
        let conWidth = imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33, constant: -50.0)
        let conHeight = imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        
        NSLayoutConstraint.activate([conX, conBottom, conWidth, conHeight])
        self.view.layoutIfNeeded()
        
        conBottom.constant = -imageView.frame.size.height/2
        conWidth.constant = 0.0
        
        UIView.animate(withDuration: 0.33, delay: 0.0,
                       usingSpringWithDamping: 0.6, initialSpringVelocity: 10.0,
                       options: [.curveEaseOut], animations: {
                        self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.67, delay: 2.0,
                       options: [], animations: {
                        conBottom.constant = imageView.frame.size.height
                        conWidth.constant = -50.0
                        self.view.layoutIfNeeded()
        }, completion: {_ in
            imageView.removeFromSuperview()
        })
    }
    
}




extension FirstViewController: afiDataAccessDelegate {
    
    func onSuccessPolicy(returnedPolicies: [Policy]) {
        print("in onSuccessPolicy = \(returnedPolicies)")
    }
    
    func onFailure() {
        print("in OnFailure; no data")
    }
    
}

func delay(seconds: Double, completion:@escaping ()->()) {
    
    let popTime = DispatchTime.now() + Double(Int64( Double(NSEC_PER_SEC) * seconds )) / Double(NSEC_PER_SEC)
    
    DispatchQueue.main.asyncAfter(deadline: popTime) {
        completion()
    }
}

