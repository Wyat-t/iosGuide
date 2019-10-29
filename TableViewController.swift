//
//  TableViewController.swift
//  Guide
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 scut. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var foodList: [Food] = [Food]()
    
    func initFoodList() {
        foodList = loadFoodFile() ?? []
        if foodList.count==0 {
            foodList.append(Food(name: "cake", foodDescription: "sweet", foodAvatar: nil))
            foodList.append(Food(name: "apple", foodDescription: "fruit", foodAvatar: nil))
        }
        
    }
    
    func saveFoodFile() {
        let success = NSKeyedArchiver.archiveRootObject(foodList, toFile: Food.ArchiveURL.path)
        if !success {
            print("failed...")
        }
    }

    func loadFoodFile() -> [Food]? {
        return (NSKeyedUnarchiver.unarchiveObject(withFile: Food.ArchiveURL.path) as? [Food])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 106
        initFoodList()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func cancelToList(segue: UIStoryboardSegue) {
        
    }
    @IBAction func saveToList(segue: UIStoryboardSegue) {
        if let addFoodVC = segue.source as? DetailViewController{
            if let addFood = addFoodVC.foodForEdit{
                if let selectedIndexPath = tableView.indexPathForSelectedRow{
                    foodList[(selectedIndexPath as NSIndexPath).row] = addFood
                    saveFoodFile()
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                } else {
                    foodList.append(addFood)
                    saveFoodFile()
                    let newIndexPath = IndexPath(row: foodList.count-1, section: 0)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
            }
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! TableViewCell

        // Configure the cell...
        cell.name?.text = foodList[indexPath.row].name
        cell.foodDescription?.text = foodList[indexPath.row].foodDescription
        cell.foodAvatar?.image = foodList[indexPath.row].foodAvatar
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            foodList.remove(at: indexPath.row)
            saveFoodFile()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let descriptionVC = segue.destination as! DetailViewController
        if let selectedCell = sender as? UITableViewCell {
            let indexPath = tableView.indexPath(for: selectedCell)!
            let selectedFood = foodList[(indexPath as NSIndexPath).row]
            descriptionVC.foodForEdit = selectedFood
        }
    }
    

}
