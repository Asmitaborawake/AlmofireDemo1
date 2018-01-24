//
//  ViewController.swift
//  AlmofireDemo1
//
//  Created by Asmita on 16/12/17.
//  Copyright © 2017 Asmita. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    @IBOutlet var tablview: UITableView!
      var Datadict = NSMutableDictionary()
    var mainarray = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        APIManagerClass().getContactDetailData(successHandler: { (responseData) in
//            print(responseData)
//         
//        if let response = responseData["contacts"] as? [[String:Any]]
//        {
//        for item in response {
//            let address = item["address"] as? String ?? ""
//            
//            let email =  item["email"] as? String ?? ""
//            
//            let gender = item["gender"] as? String ?? ""
//            
//            let name = item["name"] as? String ?? ""
//            
//               if let attachments = item["phone"] as? NSDictionary {
//                
//                let home = attachments["home"] as? String ?? ""
//                let mobile = attachments["mobile"] as? String ?? ""
//                let office = attachments["office"] as? String ?? ""
//                
//                self.Datadict = NSMutableDictionary()
//                self.Datadict.setValue(address, forKey: "address")
//                self.Datadict.setValue(email, forKey: "email")
//                self.Datadict.setValue(gender, forKey: "gender")
//                self.Datadict.setValue(name, forKey: "name")
//                self.Datadict.setValue(home, forKey: "home")
//                self.Datadict.setValue(mobile, forKey: "mobile")
//                self.Datadict.setValue(office, forKey: "office")
//                self.mainarray.add(self.Datadict)
//                self.tablview.reloadData()
//                }
//                }
//              
//                }
//            
//        }) { (error) in
//            print(error)
//        }
        
        
        let urlRequest:String = BaseURL.CallURL
        let headerhead:Dictionary<String, String> = ["Content-Type":"application/json"]
        //let params  = ["incidentid":incidentid]
        
        Alamofire.request(urlRequest, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headerhead).responseJSON { response in
            
            //debugPrint(response)
            switch(response.result) {
            case .success(_):
            if let jsonDict = response.result.value as? [String:Any],
                let response = jsonDict["contacts"] as? [[String:Any]] {
                print(response)
                for item in response {
                let address = item["address"] as? String ?? ""
                
                let email =  item["email"] as? String ?? ""
                
                let gender = item["gender"] as? String ?? ""
            
                let name = item["name"] as? String ?? ""
                
                if let attachments = item["phone"] as? NSDictionary {
                
                let home = attachments["home"] as? String ?? ""
                let mobile = attachments["mobile"] as? String ?? ""
                let office = attachments["office"] as? String ?? ""
                
                self.Datadict = NSMutableDictionary()
                self.Datadict.setValue(address, forKey: "address")
                self.Datadict.setValue(email, forKey: "email")
                self.Datadict.setValue(gender, forKey: "gender")
                self.Datadict.setValue(name, forKey: "name")
                self.Datadict.setValue(home, forKey: "home")
                self.Datadict.setValue(mobile, forKey: "mobile")
                self.Datadict.setValue(office, forKey: "office")
                self.mainarray.add(self.Datadict)
                self.tablview.reloadData()
                }
                }
                
            }
        
            break
             case .failure(_):
            print(response.result.error!)
            break
            
        }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        var dict = NSMutableDictionary()
        dict = mainarray[indexPath.row] as! NSMutableDictionary
       cell.name.text = dict.value(forKey: "name") as? String
        cell.address.text = dict.value(forKey: "address") as? String
        cell.email.text = dict.value(forKey: "email") as? String
        cell.gender.text = dict.value(forKey: "gender") as? String
        cell.home.text = dict.value(forKey: "home") as? String
        cell.office.text = dict.value(forKey: "office") as? String
        cell.mobile.text = dict.value(forKey: "mobile") as? String
        
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

