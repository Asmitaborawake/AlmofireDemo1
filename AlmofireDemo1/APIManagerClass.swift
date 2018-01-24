//
//  APIManagerClass.swift
//  AlmofireDemo1
//
//  Created by Asmita on 16/12/17.
//  Copyright © 2017 Asmita. All rights reserved.
//

import UIKit
import Alamofire

class APIManagerClass: NSObject {
    
    var manager : SessionManager?
    
    override init()
    {
        manager = Alamofire.SessionManager.default
        manager?.session.configuration.timeoutIntervalForRequest = 20
    }
    
    func getContactDetailData(successHandler: @escaping (NSDictionary) -> Void,failureHandler: @escaping (String) -> Void)
    {
        
        
        let urlRequest:String = BaseURL.CallURL
        let headerhead:Dictionary<String, String> = ["Content-Type":"application/json"]
        //let params  = ["incidentid":incidentid]
        
        manager?.request(urlRequest, method: .get, encoding: JSONEncoding.default, headers: headerhead).validate().validate().responseJSON
            { response in
                
                if response.result.isSuccess
                {
                    let resJson = response.result.value!
                    successHandler(resJson as! NSDictionary)
                }
                if response.result.isFailure
                {
                    let error : Error = response.result.error!
                    failureHandler(error.localizedDescription)
                    
                }
        }
        
    }


}
