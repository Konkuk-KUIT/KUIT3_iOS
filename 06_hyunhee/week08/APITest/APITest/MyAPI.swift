//
//  MyAPI.swift
//  APITest
//
//  Created by lee hyunhee on 5/24/24.
//

import Foundation
import Alamofire

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let age: Int
}

class MyAPI {
    func getUser(completion: @escaping (_ users: [User]) -> Void) {
        let url = "https://665006e1ec9b4a4a60306fd2.mockapi.io/User"
        
        let dataRequest = AF.request(url, method: .get, encoding: JSONEncoding.default)
        dataRequest.responseDecodable(of: [User].self) { response in
            switch response.result {
            case .success(let response):
                print("success: \(response)")
                completion(response)
            case .failure(let error):
                print("debug error: \(error)")
            }
        }
    }
    
    func addUser(completion: @escaping (_ users: User) -> Void) {
        let url = "https://665006e1ec9b4a4a60306fd2.mockapi.io/User/"
        
        let dataRequest = AF.request(url, method: .post, encoding: JSONEncoding.default)
        dataRequest.responseDecodable(of: User.self) { response in
            switch response.result {
            case .success(let response):
                print("success: \(response)")
                completion(response)
            case .failure(let error):
                print("debug error: \(error)")
            }
        }
    }
    
    func deleteUserById(id: Int, completion: @escaping (_ users: User) -> Void) {
        let url = "https://665006e1ec9b4a4a60306fd2.mockapi.io/User/\(id)"
        
        let dataRequest = AF.request(url, method: .delete, encoding: JSONEncoding.default)
        dataRequest.responseDecodable(of: User.self) { response in
            switch response.result {
            case .success(let response):
                print("success: \(response)")
                completion(response)
            case .failure(let error):
                print("debug error: \(error)")
            }
        }
    }
}
