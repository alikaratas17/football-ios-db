//
//  ViewController.swift
//  footballManager
//
//  Created by Lab on 3.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let mainScreenDataSource = MainScreenDataSource()
    
    @IBOutlet weak var mainScreenTableView: UITableView!
    @IBOutlet weak var inputField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(inputField.text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! MainScreenTableViewCell
        if let indexPath = self.mainScreenTableView.indexPath(for: cell) {
            let row = mainScreenDataSource.getRowWithIndex(index: getRealIndex(indexPath: indexPath))
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.selectedId = row
        }
    }

    func getRealIndex(indexPath: IndexPath) -> Int {
        let realIndex = indexPath.row.quotientAndRemainder(dividingBy: mainScreenDataSource.getNumberOfRows()).remainder
        return realIndex
    }
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainScreenDataSource.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainScreenTableViewCell
        
        let row = mainScreenDataSource.getRowWithIndex(index: getRealIndex(indexPath: indexPath))
        cell.mainScreenLabel.text = row
        return cell
    }
}
