//
//  APICallInterface.swift
//  BookArchive
//
//  Created by Aradhana Verma on 20/08/19.
//  Copyright © 2019 Aradhana Verma. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APICall: NSObject {
   class func makeRequestUsingAlmofire() {
        Alamofire.request("http://android.jiny.mockable.io/getAll").responseData { (resData) -> Void in
            print(resData.result.value!)
            let strOutput = String(data : resData.result.value!, encoding : String.Encoding.utf8)
            print(strOutput)
        }
    }
    
    class func makeRequestUsingAlmofireAndSwiftyJSON() {
        Alamofire.request("http://android.jiny.mockable.io/getAll").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                var arrDict : Array <Any> = []
                var arrBook : Array <BookDetail> = []
                if let resData = swiftyJsonVar["list"].arrayObject {
                    arrDict = resData as! [[String:AnyObject]]
                }
                for dict in arrDict {
                    var book = BookDetail(JSON: dict as! [String : Any])
                    arrBook.append(book)
                }
            }
        }
    }
    
    class func requestGETURL(_ strURL: String, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        Alamofire.request(strURL).responseJSON { (responseObject) -> Void in
            
//            print(responseObject)
            
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
}


