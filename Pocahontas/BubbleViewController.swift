//
//  BubbleViewController.swift
//  Pocahontas
//
//  Created by Vladislav Filipov on 07.05.2018.
//  Copyright © 2018 Vladislav Filipov. All rights reserved.
//

import UIKit

class BubbleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var BubbleTableView: UITableView!
    
    var randomArray = RandomArray()
    var sortedIndices = 0
    var globalIndex = 0
    
    override func viewWillAppear(_ animated: Bool) {
        randomArray.randomize(9, value: 100)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Bubble") as? CustomTableViewCell else { return UITableViewCell() }
        cell.cellTitleLabel.text = String(randomArray.array[indexPath.row])
        return cell
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        BubbleTableView.setAllCellViewsClear(randomArray.count)
        let unsafeIndices = randomArray.bubbleSort(&globalIndex, &sortedIndices)
        guard let indices = unsafeIndices else { return }
        BubbleTableView.beginUpdates()
        BubbleTableView.cellForRow(at: IndexPath(row: indices.0, section: 0))?.contentView.setBackgroundColor(.green)
        BubbleTableView.cellForRow(at: IndexPath(row: indices.1, section: 0))?.contentView.setBackgroundColor(.red)
        BubbleTableView.moveRow(at: IndexPath(row: indices.0, section: 0), to: IndexPath(row: indices.1, section: 0))
        BubbleTableView.moveRow(at: IndexPath(row: indices.1, section: 0), to: IndexPath(row: indices.0, section: 0))
        BubbleTableView.endUpdates()
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
