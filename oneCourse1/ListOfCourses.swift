//
//  ListOfCourses.swift
//  oneCourse
//
//  Created by MEHTAB SINGH GILL on 24/11/18.
//  Copyright © 2018 MEHTAB SINGH GILL. All rights reserved.
//

import Foundation

class ListOfCourses {
    var kourses: [Course] = []
    
    init() {
        let k = Course()
        k.faculty = "Nothing ListOfCourses_CLASS"
        k.Number = "-1"
        kourses.append(k)
        
    }
    
    func PutCourses( listan: [Course]) {
        kourses.removeAll()
        for cc in listan{
            kourses.append(cc)
        }
    }
}
