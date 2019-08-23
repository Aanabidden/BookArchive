//
//  HomeViewController.swift
//  BookArchive
//
//  Created by Aradhana Verma on 19/08/19.
//  Copyright © 2019 Aradhana Verma. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var btnCreate: UIButton!
    @IBOutlet weak var booksTableView: UITableView!
    
    var index : Int = 0
    let viewModel = HomeViewModel(dataFetcher: BookDetailFetch())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        booksTableView.tableFooterView = UIView()
        
        viewModel.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let VC = segue.destination
    }
    
    @IBAction func refreshButtonClicked(_ sender: Any) {
        if viewModel.numberOfRows > 0 {
            self.btnCreate.isHidden = true
            self.booksTableView.reloadData()
        }
    }
    
    @IBAction func filterButtonClicked(_ sender: Any) {
        
    }
    
    @IBAction func createButtonClicked(_ sender: Any) {
        
    }
}

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellView = tableView.dequeueReusableCell(withIdentifier: "Books", for: indexPath)
        let cellData = viewModel.tableCellDataModelForIndexPath(indexPath)
        cellView.textLabel?.text = cellData.title
        return cellView
    }
    
    
}

extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
    }
}
