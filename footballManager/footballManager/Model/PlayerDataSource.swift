//
//  PlayerDataSource.swift
//  footballManager
//
//  Created by Lab on 3.06.2022.
//

//import Foundation
import UIKit

struct PlayerDataSource {
    //private var playerArray: [Player] = []
    private var stringArray: [String] = []
    
    private let baseURL = "http://localhost/Project/test.php"

    init() {
        //playerArray.append(Player(name: "Ali"))
        //playerArray.append(Player(name: "Burcu"))
        stringArray.append("result1")
        stringArray.append("result2")
    }
    
    func getNumberOfRows() -> Int {
        return stringArray.count
    }
    
    func getRowWithIndex(index: Int) -> String {
        return stringArray[index]
    }

    func getQuery(qNum: String,inputStr:String) {
        let urlSession = URLSession.shared
        if let url = URL(string: "\(baseURL)?qNum=\(qNum)&input=\(inputStr)") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
                let decoder = JSONDecoder()
                if let data = data {
                    print("success")
                    //let playerArrayFromNetwork = try! decoder.decode([Player].self, from: data)
                    //print(playerArrayFromNetwork)
                    //self.playerArray.append() = playerArrayFromNetwork
                    print(String(data: data, encoding: .utf8)!)
                    //DispatchQueue.main.async {
                    //    self.delegate?.playerListLoaded()
                    //print(data)
                   // }
                    
                }
            }
            dataTask.resume()
        }
    }

    
}
