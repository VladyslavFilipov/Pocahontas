//
//  MainViewController.swift
//  Pocahontas
//
//  Created by Vladislav Filipov on 10.05.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit

class SortVisualizationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var sort = Sort(name: "", type: .bubble)
    var randomArray = RandomArray()
    var indeces = (0, 0)
    
    @IBOutlet weak var VisualizationNavigationItem: UINavigationItem!
    @IBOutlet weak var SortTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VisualizationNavigationItem.title = sort.name
        randomArray.randomize(9, value: 100)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Visualization") as? VisualizationTableViewCell else { return UITableViewCell() }
        cell.cellTitleLabel.text = String(randomArray.array[indexPath.row])
        return cell

    }
    
    @IBAction func NextButtonTapped(_ sender: Any) {
        SortTableView.setAllCellViewsClear(randomArray.count)
        var unsafeIndices: (Int,Int)?
        switch sort.type {
        case .bubble:
            unsafeIndices = randomArray.bubbleSort(&indeces.0, &indeces.1)
        case .insert:
            unsafeIndices = randomArray.insertSort(&indeces.0)
        case .selection:
            unsafeIndices = randomArray.selectionSort(&indeces.0)
        }
        guard let indices = unsafeIndices else { return }
        SortTableView.beginUpdates()
        SortTableView.cellForRow(at: IndexPath(row: indices.0, section: 0))?.contentView.setBackgroundColor(.green)
        SortTableView.cellForRow(at: IndexPath(row: indices.1, section: 0))?.contentView.setBackgroundColor(.red)
        SortTableView.moveRow(at: IndexPath(row: indices.0, section: 0), to: IndexPath(row: indices.1, section: 0))
        SortTableView.moveRow(at: IndexPath(row: indices.1, section: 0), to: IndexPath(row: indices.0, section: 0))
        SortTableView.endUpdates()
    }
}

extension UIView {
    func setBackgroundColor(_ color: UIColor) {
        self.backgroundColor = color
    }
}

extension UITableView {
    func setAllCellViewsClear(_ count: Int) {
        for index in 0..<count {
            self.cellForRow(at: IndexPath(row: index, section: 0))?.contentView.setBackgroundColor(.clear)
        }
    }
}

