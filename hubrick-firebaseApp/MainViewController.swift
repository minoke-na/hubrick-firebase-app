//
//  ViewController.swift
//  hubrick-firebaseApp
//
//  Created by Romina Felahi on 11.07.17.
//  Copyright © 2017 --AnonymousChallenge--. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var activityView: UIView!
    
    @IBAction func activityButton(_ sender: UIButton) {
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        self.activityView.isHidden = true
    }
    
    @IBOutlet weak var tableView: UITableView!{
        willSet{
            newValue.estimatedRowHeight = 350
            newValue.rowHeight = UITableViewAutomaticDimension
            
            let nib = UINib(nibName: "ItemTableViewCell", bundle: nil)
            newValue.register(nib, forCellReuseIdentifier: ItemTableViewCell.cellIdentifier)
        }
    }
    
    var itemsFeedViewModel: ItemsFeedViewModel? {
        didSet {
            itemsFeedViewModel?.itemsChanged = { [weak self] in
                self?.tableView?.reloadData()
                if (self?.itemsFeedViewModel?.itemsAdded == true) && !(self?.tableView.indexPathsForVisibleRows?.contains(IndexPath(row: 0, section: 0)))! {
                    self?.activityView.isHidden = false
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        itemsFeedViewModel = ItemsFeedViewModel()
        itemsFeedViewModel?.listenToFirebaseData()
    }

    // MARK: - Table View Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsFeedViewModel?.itemsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.cellIdentifier, for: indexPath)
        
        if let cell = cell as? ItemTableViewCell {
            cell.viewModel = itemsFeedViewModel?.itemViewModel(forIndex: indexPath.item)
        }
        return cell
    }

}


