//
//  NetworkHandler.swift
//  FitOS
//
//  Created by cumulations on 15/02/23.
//

import Foundation

class networkService{
    static var shared = networkService()
    func Post(withEndppoint:String,param:Dictionary<String,Any>, completionHandler:@escaping (status?,error?,response?,data?)->Void){
        let comPleteURL = constants.BaseUrl + withEndppoint
        var request = URLRequest(url: URL(string: comPleteURL))
        request.httpMethod = "POST"
        request.addValue("Token \(tokenString)", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { Data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completionHandler(
            }
            if let Data = Data {
                print(Data)
            }
            if let response = response {
                print(response)
            }
}
   task.resume()
    }
}
