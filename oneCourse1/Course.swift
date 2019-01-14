//
//  Course.swift
//  oneCourse
//
//  Created by MEHTAB SINGH GILL on 08/11/18.
//  Copyright © 2018 MEHTAB SINGH GILL. All rights reserved.
//

import Foundation
import Firebase

class Course : NSObject{
    var faculty = "NONE"
    var Number = "-1"
    var checked = false
    
    
    
    func NewCourse( fac: String, num: String) -> Course{
        let kourse = Course()
        kourse.faculty = fac
        kourse.Number = num
        return kourse
    }
    
    func CoursetoggleChecked(){
        checked = !checked
    }
    
    func hallo( snapshot: DataSnapshot)->Course{
        guard
            let value  = snapshot.value as? [String: AnyObject] else {
                return NewCourse(fac: "nonon", num: "11111")
        }
            let facer = value["Faculty"] as! String
        let numer = value["Number"] as! String
        return NewCourse(fac: facer, num: numer)
    }
}

