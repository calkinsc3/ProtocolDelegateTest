//
//  ClaimsDAO.swift
//  ProtocolDelegateTester
//
//  Created by William Calkins on 10/7/16.
//  Copyright © 2016 Calkins Computer Consulting. All rights reserved.
//

import Foundation

class ClaimsDAO: afiDataAccess, afiDataAccessDelegate {
    
    var delegate: afiDataAccessDelegate?
    
    var apiInteractionStarted: Bool = false
    var apiInteractionStop: Bool = false
    var apiDataMapped: Bool = false
    
    var apiDataReturnData: [afiModel]?
    required init(environment: String) {
        
    }
    
    func onSuccessPolicy(returnedPolicies: [Policy]) {
        
    }
    
    func onFailure() {
        
    }
    
    func getData() throws {
        
    }
    func putData(dataToPut: Array<afiModel>) throws {
        
    }
    func postData(dataToPost: Array<afiModel>) throws {
        
        guard let claimsAPIURL = URL(string: "https://devssg.amfam.com/claimsapi/v1/02/") else {
            return
        }
        
        guard let claimsURLComponents = NSURLComponents(url: claimsAPIURL, resolvingAgainstBaseURL: true) else {
            return
        }
        
        claimsURLComponents.query = "name=Bill"
        
        
        for claim in dataToPost {
            if let givenclaim = claim as? ClaimsModel {
                //Add query params
                if let claimNumber = givenclaim.claimsNumber {
                    claimsURLComponents.queryItems?.append(URLQueryItem(name: "claimNubmer", value: claimNumber))
                }
                if let claimName = givenclaim.nameOnClaims {
                    claimsURLComponents.queryItems?.append(URLQueryItem(name: "name", value: claimName))
                }
                if let claimIncident = givenclaim.incidentDescr {
                    claimsURLComponents.queryItems?.append(URLQueryItem(name: "incidentDesr", value: claimIncident))
                }
                if let claimsLocation = givenclaim.locationOfIncient {
                    claimsURLComponents.queryItems?.append(URLQueryItem(name: "incidentLocation", value: claimsLocation))
                }
            }
        }
        
        print("URL from Component: \(claimsURLComponents.url)")
        
    }
    func deleteData(dataToDelete: Array<afiModel>) throws {
        
    }
    
    func genericPutData<T: afiModel>(dataToPut: T) throws {
        
    }

    
}


