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
    
    
    
}

extension FirstViewController: afiDataAccessDelegate {
    
    func onSuccessPolicy(returnedPolicies: [Policy]) {
        print("in onSuccessPolicy = \(returnedPolicies)")
    }
    
    func onFailure() {
        print("in OnFailure; no data")
    }
    
}

