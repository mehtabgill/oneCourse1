//
//  Department.swift
//  oneCourse
//
//  Created by MEHTAB SINGH GILL on 08/11/18.
//  Copyright © 2018 MEHTAB SINGH GILL. All rights reserved.
//

import Foundation


class Department{

    var Name = "No Name"
    var deptCourses: [Course] = []
    //var checked = false
    
    init(name: String){
        Name = name
        if( name  == "CMPT"){
            deptCourses.append( Course().NewCourse( fac: Name, num: "102") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "105") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "106") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "110") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "118") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "120") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "125") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "126") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "127") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "128") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "129") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "130") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "135") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "150") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "165") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "166") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "170") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "213") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "218") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "225") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "250") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "261") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "275") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "213") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "276") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "295") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "300") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "305") )
            deptCourses.append( Course().NewCourse( fac: Name, num: "307") )
        }
      
    }
    
    
//    func depttoggleChecked(){
//        checked = !checked
//    }
}
