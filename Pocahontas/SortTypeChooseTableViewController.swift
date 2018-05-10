//
//  SortTypeChooseTableViewController.swift
//  Pocahontas
//
//  Created by Vladislav Filipov on 10.05.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit

class SortTypeChooseTableViewController: UITableViewController {
    
    var arrayOfSort = [Sort(name: "Bubble", type: .bubble), Sort(name: "Insert", type: .insert), Sort(name: "Selection", type: .selection)]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfSort.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SortType") as? SortTypeTableViewCell else { return UITableViewCell() }
        cell.cellTitleLabel.text = arrayOfSort[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let sortStoryboard = storyboard.instantiateViewController(withIdentifier: "SortVisualization") as? SortVisualizationViewController
            else { print("Error instantiate SortVisualization")
                return }
        sortStoryboard.sort = arrayOfSort[indexPath.row]
        self.navigationController?.pushViewController(sortStoryboard, animated: true)
    }
}

struct Sort {
    var name: String
    var type: Type
}

enum Type {
    case bubble
    case insert
    case selection
}
