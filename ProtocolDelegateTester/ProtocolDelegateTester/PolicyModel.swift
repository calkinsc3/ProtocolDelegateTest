//
//  PolicyModel.swift
//  ProtocolDelegateTester
//
//  Created by William Calkins on 10/6/16.
//  Copyright © 2016 Calkins Computer Consulting. All rights reserved.
//

import Foundation


struct Policy : afiModel {
    
    var type: String?
    var name: String?
    var owner: String?
    var effectiveDate: String?
    var policyNumber: String?
    var dueDate: String?
    var balance: String?
    var minimumDue: String?
    
    var inCoreData: Bool = false
    
    func toString() -> String {
        return ("type=\(type), name=\(name), owner=\(owner), effectiveDate=\(effectiveDate), policyNumber=\(policyNumber), dueDate=\(dueDate), balance=\(balance), minimumDue=\(minimumDue)")
    }
}
