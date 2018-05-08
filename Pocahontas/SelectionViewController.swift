//
//  SelectionViewController.swift
//  Pocahontas
//
//  Created by Vladislav Filipov on 07.05.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var SelectionTableView: UITableView!
    
    var randomArray = RandomArray()
    var globalIndex = 0
    
    override func viewWillAppear(_ animated: Bool) {
        randomArray.randomize(9, value: 100)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Selection") as? CustomTableViewCell else { return UITableViewCell() }
        cell.cellTitleLabel.text = String(randomArray.array[indexPath.row])
        return cell
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        guard 1 < randomArray.count else { return }
        SelectionTableView.setAllCellViewsClear(randomArray.count)
        guard globalIndex < randomArray.count else { return }
        let unsafeIndices = randomArray.selectionSort(&globalIndex)
        guard let indices = unsafeIndices else { return }
        SelectionTableView.cellForRow(at: IndexPath(row: indices.1, section: 0))?.contentView.setBackgroundColor(.green)
            SelectionTableView.beginUpdates()
            SelectionTableView.cellForRow(at: IndexPath(row: indices.1, section: 0))?.contentView.setBackgroundColor(.green)
            SelectionTableView.cellForRow(at: IndexPath(row: indices.0, section: 0))?.contentView.setBackgroundColor(.red)
            SelectionTableView.moveRow(at: IndexPath(row: indices.1, section: 0), to: IndexPath(row: indices.0, section: 0))
            SelectionTableView.moveRow(at: IndexPath(row: indices.0, section: 0), to: IndexPath(row: indices.1, section: 0))
            SelectionTableView.endUpdates()
    }
}
