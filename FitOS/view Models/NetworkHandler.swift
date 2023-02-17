//
//  NetworkHandler.swift
//  FitOS
//
//  Created by cumulations on 15/02/23.
//

import Foundation

class networkService{
    static var shared = networkService()
    func PostToServef(withEndppoint:String,param:Dictionary<String,Any>, completionHandler:@escaping (Bool,Int,Data?)->Void){
    }
    
    func SignIn(withToken:String,completionHandler:@escaping (Bool,Int)->Void){
        let comPleteURL = constants.BaseUrl + constants.SigniNEndpoints
        var statuscode:Int?
        var status:Bool?
        let tokenString = withToken
        var request = URLRequest(url: URL(string: comPleteURL)!)
        request.httpMethod = "POST"
        request.addValue("bearer \(tokenString)", forHTTPHeaderField: "Authorization")
        
        //Authorization : token string
        //Authorization : Bearer token
        let task = URLSession.shared.dataTask(with: request) { Data, response, error in
            if let error = error {
                print(error.localizedDescription)
                status = false
            }
            if let Data = Data {
                print(Data)
                status = true
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("http response : \(httpResponse)")
                statuscode = httpResponse.statusCode
            }
            completionHandler(status ?? false,statuscode ?? 500)
        }
        task.resume()
    }
}

