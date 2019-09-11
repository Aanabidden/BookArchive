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
        
        viewModel.loadData()
        self.viewModel.bindToSourceViewModels = { [weak self] in
            self?.refreshData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ListSegue" {
            if let destinationVC = segue.destination as? ListViewController
            {
                let indexPath = booksTableView.indexPathForSelectedRow!
                destinationVC.bookList = []
            }
        } else {
            print("\(String(describing: segue.identifier))")
        }
    }
    
    @IBAction func refreshButtonClicked(_ sender: Any) {
        viewModel.loadData()
    }
    
    @IBAction func filterButtonClicked(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Filter", preferredStyle: .actionSheet)
        
        let authorFilter = UIAlertAction(title: "Author", style: .default, handler:
        {
            (alert: UIAlertAction!) -> Void in
            self.viewModel.filterList(forType: BookFilter.Author)
        })
        
        let genreFilter = UIAlertAction(title: "Genre", style: .default, handler:
        {
            (alert: UIAlertAction!) -> Void in
            self.viewModel.filterList(forType: BookFilter.Genre)
        })
        
        let categoryFilter = UIAlertAction(title: "Category", style: .default, handler:
        {
            (alert: UIAlertAction!) -> Void in
            self.viewModel.filterList(forType: BookFilter.Category)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:
        {
            (alert: UIAlertAction!) -> Void in
            self.dismiss(animated: true, completion: nil)
        })
        optionMenu.addAction(authorFilter)
        optionMenu.addAction(genreFilter)
        optionMenu.addAction(categoryFilter)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    @IBAction func createButtonClicked(_ sender: Any) {
        
    }
    
    private func refreshData() {
        if viewModel.numberOfRows > 0 {
            self.btnCreate.isHidden = true
            self.booksTableView.reloadData()
        }
    }
}

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellView = tableView.dequeueReusableCell(withIdentifier: "Books", for: indexPath)
        let cellData = viewModel.tableCellDataModelForIndexPath(indexPath)
        cellView.textLabel?.text = cellData
        return cellView
    }
    
    
}

extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
    }
}
