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
    
    var parameters: Parameters? = [APIParameter.appId: apiKey,
                                   APIParameter.id: cityId,
                                   APIParameter.units: "metric"]
    
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
    
    func getForecasts(success:@escaping ([Forecast]) -> Void,
                      failure:@escaping (Error) -> Void) {
        
        var params = parameters
        
        params?[APIParameter.count] = 7
        
        Alamofire.SessionManager.default.request(APIPath.daily,
                                                 method: HTTPMethod.get,
                                                 parameters: params)
            
            .responseObject { (response: DataResponse<ForecastsReponse>) in
                
                guard let forecasts = response.result.value?.forecasts else {

                    failure(NSError(domain: "Request Error", code: 0, userInfo: nil))
                    return
                }
                
                success(forecasts)
        }
    }
}
