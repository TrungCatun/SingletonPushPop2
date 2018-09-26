//
//  TableViewController.swift
//  SingletonPushPop2
//
//  Created by trung on 2018/08/21.
//  Copyright © 2018 trung. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var noDataView: UIView!
    @IBOutlet weak var footerView: UIView!
    
    var hasNoData = true {
        didSet {
            hasNoData ? (tableView.tableFooterView = noDataView) : (tableView.tableFooterView = footerView)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hasNoData = Singleton.inSingleton.array.count == 0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Singleton.inSingleton.array.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(Singleton.inSingleton.array[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Singleton.inSingleton.array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            hasNoData = Singleton.inSingleton.array.count == 0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Singleton.inSingleton.index = indexPath.row
        if let toDetail = storyboard?.instantiateViewController(withIdentifier: "idDetailViewController") as? DetailViewController {
            navigationController?.pushViewController(toDetail, animated: true)
        }
    }
    

  
}
