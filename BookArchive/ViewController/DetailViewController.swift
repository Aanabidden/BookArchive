//
//  DetailViewController.swift
//  BookArchive
//
//  Created by Aradhana Verma on 19/08/19.
//  Copyright © 2019 Aradhana Verma. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var lblAbout: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backButtomClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
