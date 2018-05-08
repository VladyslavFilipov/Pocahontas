//
//  InsertViewController.swift
//  Pocahontas
//
//  Created by Vladislav Filipov on 07.05.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit

class InsertViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var InsertTableView: UITableView!
    
    var randomArray = RandomArray()
    var globalIndex = 0
    
    override func viewWillAppear(_ animated: Bool) {
        randomArray.randomize(9, value: 100)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Insert") as? CustomTableViewCell else { return UITableViewCell() }
        cell.cellTitleLabel.text = String(randomArray.array[indexPath.row])
        return cell
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        guard 1 < randomArray.count else { return }
        InsertTableView.setAllCellViewsClear(randomArray.count)
        guard globalIndex < randomArray.count - 1 else { return }
        var index = globalIndex
        InsertTableView.cellForRow(at: IndexPath(row: index, section: 0))?.contentView.setBackgroundColor(.green)
        while index >= 0 && randomArray.array[index + 1] < randomArray.array[index] {
            InsertTableView.setAllCellViewsClear(randomArray.count)
            randomArray.array.swapAt(index, index + 1)
            InsertTableView.beginUpdates()
            InsertTableView.cellForRow(at: IndexPath(row: index + 1, section: 0))?.contentView.setBackgroundColor(.green)
            InsertTableView.cellForRow(at: IndexPath(row: index, section: 0))?.contentView.setBackgroundColor(.red)
            InsertTableView.moveRow(at: IndexPath(row: index + 1, section: 0), to: IndexPath(row: index, section: 0))
            InsertTableView.moveRow(at: IndexPath(row: index, section: 0), to: IndexPath(row: index + 1, section: 0))
            InsertTableView.endUpdates()
            index -= 1
        }
        globalIndex += 1
    }
}
