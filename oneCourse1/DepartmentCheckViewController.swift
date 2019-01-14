//
//  ViewController.swift
//  oneCourse
//
//  Created by MEHTAB SINGH GILL on 08/11/18.
//  Copyright © 2018 MEHTAB SINGH GILL. All rights reserved.
//

import UIKit
import Firebase

class DepartmentCheckViewController: UITableViewController {

    var department : Department
    var StudentCourseList: [Course] = []
    
    required init? (coder aDecoder : NSCoder) {
        department = Department(name: "CMPT")
        super.init(coder :aDecoder)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let rootRef = Database.database().reference()
        let childRef = Database.database().reference(withPath: "MyCourses")
        let itemsRef = rootRef.child("MyCourses")
//        let friend1ref = itemsRef.child("F1")
        childRef.observe(.value, with: {
            snapshot in
            var newItems: [Course] = []
            print(snapshot.children)
            for item in snapshot.children{
                let NewCourse  = Course().hallo(snapshot: item as! DataSnapshot)
                newItems.append(NewCourse)
            }
            self.StudentCourseList = newItems
            self.tableView.reloadData()
        })

//        print(rootRef.key)
//        print(childRef.key)
//        print(itemsRef.key)
//        print(friend1ref.key)
        
        
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "department101", for: indexPath)
        
        if let label = cell.viewWithTag(1000) as? UILabel{
            label.text = department.Name
        }
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            let dep = department
            //tableView.deselectRow(at: indexPath, animated: true) // selected row hatane ke liye
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "SelectCouseSegueWay" {
            if let getDepartment = segue.destination as? CourseSelectTableViewController{
                if let cell = sender as? UITableViewCell,
                    let _ = tableView.indexPath(for: cell) {
                    let item = department
                    getDepartment.department = item
                    getDepartment.StudentCourseList99 = self.StudentCourseList
                    //Firebase:::::::::::::::::::
//                    let MyCourseListRefrence99 = Database.database().reference(withPath: "MyCourses")
//
//                    MyCourseListRefrence99.observe(.value, with: {
//                        snapshot in
//                        var newItems: [Course] = []
//                        print(snapshot.children)
//                        for item in snapshot.children{
//                            let NewCourse  = Course().hallo(snapshot: item as! DataSnapshot)
//                            newItems.append(NewCourse)
//                        }
//                        getDepartment.StudentCourseList99 = self.StudentCourseList
                    
//                    })
                }
            }
        }
    }

    }


    
    
    
    
    


