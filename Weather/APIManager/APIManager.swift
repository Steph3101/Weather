//
//  APIManager.swift
//  Weather
//
//  Created by Stéphane AZZOPARDI on 05/01/2017.
//  Copyright © 2017 Stéhane Azzopardi AE. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class APIManager: NSObject {   
    
    static let sharedInstance: APIManager = APIManager()
    
    var parameters: Parameters? = [APIParameter.appId : apiKey,
                                   APIParameter.id : cityId]
    
    func getCurrentWeather(success:@escaping (Weather) -> Void,
                           failure:@escaping (Error) -> Void) {
        Alamofire.SessionManager.default.request(APIPath.weather,
                                                 method: HTTPMethod.get,
                                                 parameters: parameters)
            
            .responseObject { (response: DataResponse<Weather>) in
            
                if let weather = response.result.value {
                    
                    success(weather)
                } else {
                    
                    failure(NSError(domain: "Request Error", code: 0, userInfo: nil))
                }
        }
    }
}
