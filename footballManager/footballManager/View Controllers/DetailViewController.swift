//
//  DetailViewController.swift
//  footballManager
//
//  Created by Lab on 3.06.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedId: String?
    
    let playerDataSource = PlayerDataSource()

    @IBOutlet weak var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //playerDataSource.getQuery(qNum: String,inputStr:String)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = selectedId
    }
    
    func getRealIndex(indexPath: IndexPath) -> Int {
        let realIndex = indexPath.row.quotientAndRemainder(dividingBy: playerDataSource.getNumberOfRows()).remainder
        return realIndex
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerDataSource.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailTableViewCell
        
        let row = playerDataSource.getRowWithIndex(index: getRealIndex(indexPath: indexPath))
        cell.detailLabel.text = row
        return cell
    }
}
