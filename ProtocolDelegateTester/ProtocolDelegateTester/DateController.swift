//
//  DateController.swift
//  ProtocolDelegateTester
//
//  Created by William Calkins on 12/8/16.
//  Copyright © 2016 Calkins Computer Consulting. All rights reserved.
//

import UIKit

class DateController: UIViewController {

    
    @IBOutlet weak var currentDate: UILabel!
    @IBOutlet weak var selectedDate: UILabel!
    @IBOutlet weak var datePassDue: UILabel!
    @IBOutlet weak var datePass10Pass: UILabel!
    @IBOutlet weak var selectedDatePicker: UIDatePicker!
    
    let today = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.currentDate.text = today.description
        self.selectedDate.text = self.selectedDatePicker.date.description
        self.datePassDue.text = ""
        self.datePass10Pass.text = ""
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelMe(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        self.selectedDate.text = self.selectedDatePicker.date.description
        //self.datePassDue.text = self.selectedDatePicker.date.description
        
        if self.checkPassDueDate() {
            self.datePassDue.text = self.selectedDatePicker.date.description
            self.datePassDue.backgroundColor = UIColor.red
        } else {
            self.datePassDue.backgroundColor = UIColor.clear
            self.datePassDue.text = ""
        }
        
//        if self.dateWithinTenDays() {
//            self.datePass10Pass.text = self.selectedDatePicker.date.description
//            self.datePass10Pass.backgroundColor = UIColor.red
//        } else {
//            self.datePass10Pass.backgroundColor = UIColor.clear
//        }
    }
    
    func checkPassDueDate() -> Bool {
        print("checkPassDueDate = \(today.compare(self.selectedDatePicker.date) == .orderedAscending)")
        
        return today.compare(self.selectedDatePicker.date) == .orderedAscending
    }
    
    func dateWithinTenDays() -> Bool {
        return true
    }
    
    
    
    
    
    
    

    

}
