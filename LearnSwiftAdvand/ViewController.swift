//
//  ViewController.swift
//  LearnSwiftAdvand
//
//  Created by s3 on 4/13/21.
//

import UIKit

struct People {
    var name: String = ""
    var address: String = ""
    
    static func createHardcode_People() -> People {
        var item = People()
        item.name = "Name With Random ID: \(arc4random()%100)"
        item.address = "\(item.name) on address: \(arc4random()%111)"
        return item
    }
}

class ViewController: UIViewController {

    
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtAddress: UITextField!
    @IBOutlet var tbvListpeople: UITableView!
    
    final var listPeople:[People] = [] {
        didSet {
            tbvListpeople.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tbvListpeople.reloadData()
    }

    @IBAction func clickDeleteList(_ sender: Any) {
        if listPeople.count > 0 {
            listPeople.removeLast()
        }
    }
    
    @IBAction func clickAddList(_ sender: Any) {
        listPeople.append(People.createHardcode_People())
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPeople.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemP = listPeople[indexPath.row]
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell Temp")
        cell.textLabel?.text = itemP.name
        return cell
    }
    
    
}
