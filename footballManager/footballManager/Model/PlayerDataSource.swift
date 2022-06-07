//
//  PlayerDataSource.swift
//  footballManager
//
//  Created by Lab on 3.06.2022.
//

//import Foundation
import UIKit

struct PlayerDataSource {
    private var playerArray: [Player] = []
    
    private let baseURL = "http://localhost/Project/test.php"

    init() {
        playerArray.append(Player(name: "Ali"))
        playerArray.append(Player(name: "Burcu"))
    }
    
    func getNumberOfRows() -> Int {
        return playerArray.count
    }
    
    func getRowWithIndex(index: Int) -> Player {
        return playerArray[index]
    }
    struct Book: Decodable {

        // MARK: - Properties

        let title: String
        let author: String

    }
    func loadPlayerList() {
        /*
        let url = URL(string:"\(baseURL)")!
        
        var request = URLRequest(url: url)

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let books = try? JSONDecoder().decode([Book].self, from: data) {
                    print(books)
                } else {
                    print("Invalid Response")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        */
        
        let urlSession = URLSession.shared
        if let url = URL(string: "\(baseURL)?qNum=1&name=allianz-cup") {
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
