//
//  ViewController.swift
//  Sections
//
//  Created by Vasilii on 16/08/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let sectionsTableIdentifier = "SectionsTableIdentifier"
    var names: [String: [String]]!
    var keys: [String]!
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: sectionsTableIdentifier)
        
        let path = Bundle.main.path(forResource: "sortednames", ofType: "plist")
        let nameDict = NSDictionary(contentsOfFile: path!)
        names = nameDict as! [String: [String]]
        keys = (nameDict!.allKeys as! [String]).sorted()
    }

    // MARK: - Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keys.count
    }
    
    /*
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = keys[section]
        let nameSection = names[key]
        return nameSection.count
    }
 */
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: sectionsTableIdentifier, for: indexPath) as UITableViewCell
        let key = keys[indexPath.section]
        let namesSection = names[key]!
        cell.textLabel?.text = namesSection[indexPath.row]
        
        return cell
    }
    
}

