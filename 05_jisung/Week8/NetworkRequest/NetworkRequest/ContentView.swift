//
//  ContentView.swift
//  URLSessionProject
//
//  Created by 임지성 on 5/18/24.
//
 
import Alamofire
import SwiftUI

struct User: Codable {
    let name: String
    let age: Int
}

class Network {
    func urlSessionExample() {
        guard let url = URL(string: "") else {
            print("url not correct")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        //shared 사용
        URLSession.shared.dataTask(with: request) { data, response, error in
            //data: 서버에서 받은 데이터
            //response: HTTP 상태 코드(성공 시 200)
            do {
                let decodedData = try JSONDecoder().decode(User.self, from: data!)
                print("Decoding success: \(decodedData)")
            } catch {
                print("Decoding failed")
            }
        }.resume()
        
        //shared가 아닌 configuration을 사용하는 코드
        URLSession(configuration: .default).dataTask(with: url)
    }
}

struct KonkukStudent: Codable {
    let name: String
    let StudentId: Int
    let id: String
}

class UserAPI {
    let url = "https://6648825f2bb946cf2fa0d0fa.mockapi.io/KonkukStudent"
    
    func getUser(completion: @escaping (_ konkukStudents: [KonkukStudent]) -> Void) {
        let dataRequest = AF.request(url, method: .get)
        
        dataRequest.responseDecodable(of: [KonkukStudent].self) { response in
            switch response.result {
            case .success(let response):
                print("Success: \(response)")
                completion(response) //response에는 User타입의 배열이 담김
            case .failure(let error):
                print("debug error: \(error)")
            }
        }
    }
}

struct ContentView: View {
    @State private var students: [KonkukStudent] = []
    
    var body: some View {
        VStack {
            ForEach(students, id: \.self.id) { students in
                Text(String(students.StudentId))
            }
        }
        .onAppear(
            perform: {
                UserAPI().getUser { students in
                    self.students = students
                }
            }
        )
    }
}



#Preview {
    ContentView()
}

