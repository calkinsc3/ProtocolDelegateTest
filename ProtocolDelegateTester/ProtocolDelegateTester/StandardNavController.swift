//
//  StandardNavController.swift
//  ProtocolDelegateTester
//
//  Created by William Calkins on 11/20/16.
//  Copyright © 2016 Calkins Computer Consulting. All rights reserved.
//

import UIKit

class StandardNavController: UIViewController {

    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
