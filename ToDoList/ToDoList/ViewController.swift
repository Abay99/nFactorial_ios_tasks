//
//  ViewController.swift
//  ToDoList
//
//  Created by Abai Kalikov on 6/28/18.
//  Copyright © 2018 Abai Kalikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, Savable {
//
//    var lists: [List] = [List.init("Go to Disney", "2011-10-23", UIImage.init(named: "phone")!)]
    
    var lists: [List] = []
    
    var filteredData: [List] = []
    var isSearching = false
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    func save(c: List) {
        lists.append(c)
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
    }
 
//    @IBOutlet weak var Segment: UISegmentedControl!
//    @IBAction func segmentChanged(_ sender: Any) {
//        switch Segment.selectedSegmentIndex {
//        case 0:
//            <#code#>
//
//        case 1:
//            <#code#>
//
//        case 2:
//            <#code#>
//
//        default:
//            print("Segment is not right!")
//        }
//    }

    
    @IBOutlet weak var editBarButton: UIBarButtonItem!
    
    @IBAction func editBarButtonPressed(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
        switch tableView.isEditing {
        case true:
            editBarButton.title = "Done"
        case false:
            editBarButton.title = "Edit"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredData.count
        }
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 98
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            lists.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell

//            cell.event.text = lists[indexPath.row].event
//            cell.date.text = lists[indexPath.row].date
//            cell.photo.image = lists[indexPath.row].photo
        
        
//        let text: String!
        
        if isSearching{
            cell.event.text = filteredData[indexPath.row].event
            cell.date.text = filteredData[indexPath.row].date
            cell.photo.image = filteredData[indexPath.row].photo
        }else{
            cell.event.text = lists[indexPath.row].event
            cell.date.text = lists[indexPath.row].date
            cell.photo.image = lists[indexPath.row].photo
        }
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            view.endEditing(true)
            tableView.reloadData()
        }else{
            isSearching = true
            filteredData = lists.filter ({$0.event?.range(of: searchText) != nil})
            tableView.reloadData()
        }
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = lists[sourceIndexPath.row]
        lists.remove(at: sourceIndexPath.row)
        lists.insert(item, at: destinationIndexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    
        let destination = segue.destination as! CreateListViewController
        destination.receive = self
        
    }
}
