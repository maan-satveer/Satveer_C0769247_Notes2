//
//  CellTableViewController.swift
//  Satveer_C0769247_Notes
//
//  Created by MacStudent on 2019-11-08.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class CellTableViewController: UITableViewController {
    var folder : [String]?
    var folders:UITextField!
    @IBOutlet var tabledata: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
self.navigationItem.rightBarButtonItem = self.editButtonItem
        folder = []
    }

    @IBAction func new_folder(_ sender: UIBarButtonItem) {
        addnewfolder()
    }
    func addnewfolder() {
        let alertctrl = UIAlertController(title: "New Folder", message: "Enter the name of folder", preferredStyle: .alert)
        alertctrl.addTextField { (textField) in
            textField.text = ""
        }
         let okAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let add = UIAlertAction(title: "AddItem", style: .default) { (action) in
            let txt = alertctrl.textFields![0]
            self.folder!.append(txt.text!)
            print(self.folder!)
            self.tabledata.reloadData()
        }
        alertctrl.addAction(okAction)
        alertctrl.addAction(add)
        self.present(alertctrl, animated: true, completion: nil)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return folder?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell"){
            let foldername = folder![indexPath.row]
                cell.textLabel?.text = foldername
                   cell.imageView?.image = UIImage(named: "folder-icon")
                          return cell
        }
        // Configure the cell...

        return UITableViewCell()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
