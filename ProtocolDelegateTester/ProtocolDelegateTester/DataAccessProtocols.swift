//
//  DataAccessProtocols.swift
//  ProtocolDelegateTester
//
//  Created by William Calkins on 10/6/16.
//  Copyright © 2016 Calkins Computer Consulting. All rights reserved.
//

import Foundation


protocol afiModel {
    
    var inCoreData: Bool { get }
    
    func toString() -> String
}

protocol afiDataAccessDelegate {
    
    var apiInteractionStarted: Bool { get set}
    var apiInteractionStop: Bool { get set }
    var apiDataMapped: Bool { get set }
    
    var apiDataReturnData: [afiModel]? { get set }
    
    func onSuccessPolicy(returnedPolicies: [Policy])
    func onFailure()
    
}

protocol afiDataAccess {
    
    var delegate: afiDataAccessDelegate? { get set }
    
    init(environment: String)
    
    func getData() throws
    func putData(dataToPut: Array<afiModel>) throws
    func postData(dataToPost: Array<afiModel>) throws
    func deleteData(dataToDelete: Array<afiModel>) throws
    
    func genericPutData<T: afiModel>(dataToPut: T) throws
    
}

extension afiDataAccessDelegate {
    func onSuccessPolicy(returnedPolicies: [Policy]){}
    func onFailure() {}
}



