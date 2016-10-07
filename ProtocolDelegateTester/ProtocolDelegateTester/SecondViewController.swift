//
//  SecondViewController.swift
//  ProtocolDelegateTester
//
//  Created by William Calkins on 10/6/16.
//  Copyright © 2016 Calkins Computer Consulting. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, afiDataAccessDelegate {

    let claimsDAO = ClaimsDAO(environment: "DEV")
    
    var apiInteractionStarted: Bool = false
    var apiInteractionStop: Bool = false
    var apiDataMapped: Bool = false
    
    var apiDataReturnData: [afiModel]? {
        didSet {
            print("in the did set for data return")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.claimsDAO.delegate = self
        do {
            let claim1 = ClaimsModel(inCoreData: false, claimsNumber: "7897898989", nameOnClaims: "Elvis Costello", incidentDescr: "Hit the Impeial Bedroom", locationOfIncient: "London")
            let claim2 = ClaimsModel(inCoreData: true, claimsNumber: "4434343", nameOnClaims: "Jimi Hendrix", incidentDescr: "Touched the sky", locationOfIncient: "Purple Haze")
            let claim3 = ClaimsModel(inCoreData: true, claimsNumber: "jddjkljkljk", nameOnClaims: "Simon-Garfunkle", incidentDescr: "Over troubled waters", locationOfIncient: "New York")
            
            try self.claimsDAO.postData(dataToPost: [claim1, claim2, claim3])
            
        } catch {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onSuccessPolicy(returnedPolicies: [Policy]) {
        
    }
    
    func onFailure() {
        
    }

}

