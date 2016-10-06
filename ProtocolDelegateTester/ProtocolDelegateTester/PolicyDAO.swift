//
//  PolicyDAO.swift
//  ProtocolDelegateTester
//
//  Created by William Calkins on 10/6/16.
//  Copyright © 2016 Calkins Computer Consulting. All rights reserved.
//

import Foundation

class PolicyDAO : afiDataAccess, afiDataAccessDelegate {
    
    var delegate: afiDataAccessDelegate?
    
    var environment: String?
    var apiInteractionStarted: Bool
    var apiInteractionStop: Bool
    var apiDataMapped: Bool
    
    var apiDataReturnData: [afiModel]?
    
    
    required init(environment: String) {
        self.environment = environment
        self.apiInteractionStarted = false
        self.apiInteractionStop = false
        self.apiDataMapped = false
    }
    
    deinit {
        self.delegate?.apiInteractionStarted = false
        self.delegate?.apiInteractionStop = false
        self.delegate?.apiDataMapped = false
    }
    
    func genericPutData<T : afiModel>(dataToPut: T) throws {
        self.delegate?.apiInteractionStarted = true
        
    }
    
    
    
    func getData() throws {
        
        self.delegate?.apiInteractionStarted = true
        
        let policy1 = Policy(type: "Home Owners", name: "Ringo Star", owner: "Ringo Star", effectiveDate:
            "11/12/16", policyNumber: "410023434354", dueDate: "8/12/16", balance: "30", minimumDue: "50", inCoreData: true)
        let policy2 = Policy(type: "Vehicle", name: "Bill Calkins", owner: "Bill Calkins", effectiveDate: "11/12/16", policyNumber: "4100-00-789790", dueDate: "11/12/12", balance: "23.00", minimumDue: "24.00", inCoreData: false)
        let policy3 = Policy(type: "Umbrella", name: "George Micheal", owner: "Garth Brooks", effectiveDate: "12/23/12", policyNumber: "4100-00-99999", dueDate: "12/12/16", balance: "34.00", minimumDue: "24.00", inCoreData: false)
        
        self.delegate?.apiInteractionStop = true
        
        //self.delegate?.apiDataReturnData = [policy1, policy2, policy3]
        self.delegate?.onSuccessPolicy(returnedPolicies: [policy1, policy2, policy3])
        
    }
    func putData(dataToPut: [afiModel]) throws {
        
    }
    
    func postData(dataToPost: [afiModel]) throws {
        
    }
    
    func deleteData(dataToDelete: [afiModel]) throws {
        
    }
    
}
