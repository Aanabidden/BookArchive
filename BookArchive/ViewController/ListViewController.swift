//
//  ListViewController.swift
//  BookArchive
//
//  Created by Aradhana Verma on 19/08/19.
//  Copyright © 2019 Aradhana Verma. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    public var index : Int = 0
    
    @IBOutlet weak var ListTableView: UITableView!
    var bookList: Array<BookDetails> = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ListTableView.tableFooterView = UIView()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//        let VC = segue.destination as DetailViewController?
//        VC.
    }

    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


extension ListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellView = tableView.dequeueReusableCell(withIdentifier: "List", for: indexPath)
        cellView.textLabel?.text = bookList[indexPath.row].title
        return cellView
    }
    
    
}

extension ListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
    }
}
