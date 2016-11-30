//
//  AmfamNavViewController.swift
//  ProtocolDelegateTester
//
//  Created by William Calkins on 11/20/16.
//  Copyright © 2016 Calkins Computer Consulting. All rights reserved.
//

import UIKit

class AmfamNavViewController: UIViewController {

    @IBOutlet weak var vcTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vcTitle.text = self.title

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParentViewController {
            print("viewWillDisappear: isMovingFromParentViewController")
        }
        
        if let vcsInNav = self.navigationController?.viewControllers {
            print("viewWillDisappear: vcs in stack: \(vcsInNav.count)")
            for vc in vcsInNav {
                print("VCs in Nav = \(vc.title)")
            }
        }
        
    }
    
    
//    
//    override func willMove(toParentViewController parent: UIViewController?) {
//        super.willMove(toParentViewController: parent)
//        
//        if let givenParent = parent, let parentTitle = givenParent.title {
//            print("willMove: parent VCs name is  = \(parentTitle)")
//        }
//    }
//    
//    override func didMove(toParentViewController parent: UIViewController?) {
//        if let givenParent = parent, let parentTitle = givenParent.title {
//            print("didMove: parent VCs name is  = \(parentTitle)")
//        }
//    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
