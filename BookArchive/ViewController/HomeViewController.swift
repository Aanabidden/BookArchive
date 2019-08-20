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
    var bookList: Array<BookDetails> = []
    var index : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        booksTableView.tableFooterView = UIView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let VC = segue.destination
    }

    @IBAction func filterButtonClicked(_ sender: Any) {
        
    }
    
    @IBAction func createButtonClicked(_ sender: Any) {
        
    }
}

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellView = tableView.dequeueReusableCell(withIdentifier: "Books", for: indexPath)
        cellView.textLabel?.text = bookList[indexPath.row].title
        return cellView
    }
    
    
}

extension HomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
    }
}
