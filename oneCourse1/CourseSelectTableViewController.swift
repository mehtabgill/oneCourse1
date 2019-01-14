//
//  CourseSelectTableViewController.swift
//  oneCourse
//
//  Created by MEHTAB SINGH GILL on 08/11/18.
//  Copyright © 2018 MEHTAB SINGH GILL. All rights reserved.
//

import UIKit
import Firebase

//protocol CourseSelectTableViewControllerDelegate: class{
//    func getDepartment( controller: CourseSelectTableViewController, didFinishing dept: Department)
//    func AddCourses( ccontroller : CourseSelectTableViewController, didFinishing list: [Course] )
//}

class CourseSelectTableViewController: UITableViewController {
    
    weak var department : Department?
    var finalDept : Department
    var StudentCourseList99: [Course] = []
    var TempList: [Course] = []
//    weak var delegate: CourseSelectTableViewControllerDelegate?
    var addedCoursesArray: [Course] = []
    
    let MyCourseListRefrence = Database.database().reference(withPath: "MyCourses")
    
    @IBAction func DoneButton(_ sender: UIButton!) {
        performSegue(withIdentifier: "MyCourseSegue", sender: self)
    }
    
    required init? (coder aDecoder : NSCoder) {
        finalDept = Department(name: "no dept")
        super.init(coder :aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = department{
            finalDept = item
        }

        for cc in finalDept.deptCourses{
            for cc1 in StudentCourseList99{
                if cc.faculty == cc1.faculty && cc.Number == cc1.Number{
                    if let indexi = finalDept.deptCourses.index(of: cc){
                        finalDept.deptCourses.remove(at: indexi)
                    }
                }
            }
        }
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        
    }

    @IBAction func Back( sender: Any ){
        for cc in finalDept.deptCourses{
            if cc.checked{
                cc.checked  = false
            }
        }
        navigationController?.popViewController(animated: true)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return department?.deptCourses.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CourseSelect101", for: indexPath)
        if let label = cell.viewWithTag(2000) as? UILabel{
            let item = finalDept.deptCourses[indexPath.row]
            label.text = item.faculty + " " + item.Number
            if item.checked{
                cell.accessoryType = .checkmark
            }else{
                cell.accessoryType = .none
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            let item = finalDept.deptCourses[indexPath.row]
            if item.checked {
                cell.accessoryType = .none
            }
            else{
                cell.accessoryType = .checkmark
                let NewCourse = finalDept.deptCourses[indexPath.row]
                addedCoursesArray.append(NewCourse)  // Course Added To List!!
            }
            item.CoursetoggleChecked() //CAREFULL!! checkMark changes
            tableView.deselectRow(at: indexPath, animated: true) // selected row hatane ke liye
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MyCourseSegue" {
            if let addCoursesViewController = segue.destination as? MyCoursesTableViewController{
                var check_duplis = Set<Course>()
                for elem in StudentCourseList99{
                    if ( !check_duplis.contains(elem) ){
                        
                        //Firebase Trials :::::
                        let CourseName  = elem.faculty + " " + elem.Number
                        let FrndRef = self.MyCourseListRefrence.child(CourseName)
                        let values: [String: Any] = ["Faculty": elem.faculty, "Number": elem.Number]
                        FrndRef.setValue(values)
                        
                        addCoursesViewController.MyCourselist.append(elem)
                        check_duplis.insert(elem)
                    }
                }
                for elem in addedCoursesArray{
                    if ( !check_duplis.contains(elem)){
                        
                        //Firebase Trials :::::
                        let CourseName  = elem.faculty + " " + elem.Number
                        let FrndRef = self.MyCourseListRefrence.child(CourseName)
                        let values: [String: Any] = ["Faculty": elem.faculty, "Number": elem.Number]
                        FrndRef.setValue(values)
                        
                        addCoursesViewController.MyCourselist.append(elem)
                        check_duplis.insert(elem)
                    }
                }
                
                
//                var Carray: [String] = []
//                for elem in StudentCourseList99{
//                    Carray.append(elem.faculty + elem.Number)
//                }
//                for elem in addedCoursesArray{
//                    Carray.append(elem.faculty + elem.Number)
//                }
                
                //Firebase Trials :::::::
//                let FrndRef = self.MyCourseListRefrence.child(
//                let values: [String: Any] =  ["]
//                FrndRef.setValue(values)
                
                //Firebase Read Values If stored AS STRINGS:: :::
//                MyCourseListRefrence.observe(.value, with: {
//                    snapshot in
//                    let values  = snapshot.value as! [String]
////                    for elem in values{
//                        addCoursesViewController.Mycourses.append(values[0])
////                    }
//                })
            }
        }
        
        
        
    }
 }
