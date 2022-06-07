//
//  PlayerDataSource.swift
//  footballManager
//
//  Created by Lab on 3.06.2022.
//

//import Foundation
import UIKit

class PlayerDataSource {
    //private var playerArray: [Player] = []
    private var stringArray: [String] = []
    
    private let baseURL = "http://localhost/Project/test.php"

    init() {
        //playerArray.append(Player(name: "Ali"))
        //playerArray.append(Player(name: "Burcu"))

    }
    
    func getNumberOfRows() -> Int {
        return stringArray.count
    }
    
    func getRowWithIndex(index: Int) -> String {
        return stringArray[index]
    }

    func getQuery(qNum: String?,inputStr:String?){
        //print(qNum!)
        //print(inputStr!)
        let urlSession = URLSession.shared
        if let url = URL(string: "\(baseURL)?qNum=\(qNum!)&input=\(inputStr!)") {
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
                    if qNum == "0" {
                        var splitted: [String.SubSequence] = []
                        splitted = String(data: data, encoding: .utf8)!.split(separator: ";")
                        self.stringArray.append("Player: \(splitted[0])")
                        self.stringArray.append("Number of Goals: \(splitted[1])")
                    }
                    if qNum == "1" {
                        var splitted: [String.SubSequence] = []
                        splitted = String(data: data, encoding: .utf8)!.split(separator: ";")
                        self.stringArray.append("Refree: \(splitted[0])")
                        self.stringArray.append("Goal Average: \(splitted[1])")
                    }
                    if qNum == "2" {
                        var splitted: [String.SubSequence] = []
                        splitted = String(data: data, encoding: .utf8)!.split(separator: ";")
                        self.stringArray.append("Player: \(splitted[0])")
                        self.stringArray.append("ATH Market Value: \(splitted[1])")
                    }
                    if qNum == "3" {
                        var splitted: [String.SubSequence] = []
                        splitted = String(data: data, encoding: .utf8)!.split(separator: ";")
                        self.stringArray.append("Player: \(splitted[0])")
                        self.stringArray.append("Number of Goals: \(splitted[1])")
                    }
                    if qNum == "4" {
                        var splitted: [String.SubSequence] = []
                        splitted = String(data: data, encoding: .utf8)!.split(separator: ";")
                        self.stringArray.append("Player: \(splitted[0])")
                        self.stringArray.append("Number of Goals: \(splitted[1])")
                    }
                    
                }
            }
            dataTask.resume()
        }
        
        
    }
    
    
}
