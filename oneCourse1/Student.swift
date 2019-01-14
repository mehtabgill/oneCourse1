//
//  Student.swift
//  oneCourse
//
//  Created by MEHTAB SINGH GILL on 08/11/18.
//  Copyright © 2018 MEHTAB SINGH GILL. All rights reserved.
//

import Foundation

class Student{
    var MyCourses: [Course] = []
    
    init(){
        MyCourses.append(Course().NewCourse(fac: "No Name", num: "-2"))
    }
    
    func AddnewCourse(course: Course){
        MyCourses.append(course)
    }
}
