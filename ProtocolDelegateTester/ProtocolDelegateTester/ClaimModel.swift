//
//  ClaimModel.swift
//  ProtocolDelegateTester
//
//  Created by William Calkins on 10/7/16.
//  Copyright © 2016 Calkins Computer Consulting. All rights reserved.
//

import Foundation


struct ClaimsModel: afiModel {
    
    var inCoreData: Bool = false
    
    var claimsNumber: String?
    var nameOnClaims: String?
    var incidentDescr: String?
    var locationOfIncient: String?
    
    func toString() -> String{
        return("return")
    }
}
