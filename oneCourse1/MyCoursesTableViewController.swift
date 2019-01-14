//
//  MyCoursesTableViewController.swift
//  oneCourse
//
//  Created by MEHTAB SINGH GILL on 24/11/18.
//  Copyright © 2018 MEHTAB SINGH GILL. All rights reserved.
//

import UIKit
import Firebase

class MyCoursesTableViewController: UITableViewController {
    
    var MyCourselist: [Course] = []
    let MyCourseListRefrence99 = Database.database().reference(withPath: "MyCourses")

    required init? (coder aDecoder : NSCoder) {
        super.init(coder :aDecoder)
    }
    override func viewDidLoad() {
           super.viewDidLoad()
        
        MyCourseListRefrence99.observe(.value, with: {
            snapshot in
            var newItems: [Course] = []
            print(snapshot.children)
            for item in snapshot.children{
                let NewCourse  = Course().hallo(snapshot: item as! DataSnapshot)
                newItems.append(NewCourse)
            }
            self.MyCourselist = newItems
            self.tableView.reloadData()
        })
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    @IBAction func AddCourse_button(_ sender: Any) {
        performSegue(withIdentifier: "GoBackToDEPTsegue", sender: self)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyCourselist.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCourses101", for: indexPath)
        if let label = cell.viewWithTag(3000) as? UILabel{
            let item = MyCourselist[indexPath.row]
            label.text = item.faculty + " " + item.Number

        }
        return cell
    }
    @IBAction func DeleteButtonTapped(_ sender: Any) {
        if let selectedRows = tableView.indexPathsForSelectedRows{
            var items = [Course]()
            for indexpath in selectedRows{
                items.append(MyCourselist[indexpath.row])
            }
            
            // Deleting items from Model ::::::::
            for item in items{
                if let indexofItem = items.index(of: item){
                    MyCourselist = MyCourselist.filter() { $0 !== item }
                    let CourseName  = item.faculty + " " + item.Number
                    let FrndRef = MyCourseListRefrence99.child(CourseName)
                    FrndRef.removeValue()
                }
            }
            
            tableView.beginUpdates()
            tableView.deleteRows(at: selectedRows, with: .automatic)
            tableView.endUpdates()
        }
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoBackToDEPTsegue" {
            if let addCoursesViewController = segue.destination as? DepartmentCheckViewController{
                addCoursesViewController.StudentCourseList = MyCourselist 
            }
        }
    }

}
