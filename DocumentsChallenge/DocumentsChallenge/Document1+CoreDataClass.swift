//
//  Document1+CoreDataClass.swift
//  Documents
//
//  Created by 刘洋 on 6/22/19.
//  Copyright © 2019 Chris Rehagen. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Document1)
public class Document1: NSManagedObject {
    var riqi: Date?{
        get {
            return date as Date?
        } set {
            date = newValue as NSDate?
        }
    }
    
    convenience init?(name: String?, neirong: String?) {
        let appDelegat = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegat?.persistentContainer.viewContext else{
            return nil
        }
        self.init(entity: Document1.entity(), insertInto: managedContext)
        self.name = name
        self.riqi = Date(timeIntervalSinceNow: 0)
        self.neirong = neirong
        if let size = neirong?.count {
            self.size = Int64(size)
        } else {
            self.size = 0
        }
    }
    
    
    func genxin(name: String, neirong:String?) {
        self.name = name
        self.riqi = Date(timeIntervalSinceNow: 0)
        self.neirong = neirong
        if let size = neirong?.count {
            self.size = Int64(size)
        } else {
            self.size = 0
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
