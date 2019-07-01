//
//  Document1+CoreDataProperties.swift
//  Documents
//
//  Created by 刘洋 on 6/22/19.
//  Copyright © 2019 Chris Rehagen. All rights reserved.
//
//

import Foundation
import CoreData


extension Document1 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Document1> {
        return NSFetchRequest<Document1>(entityName: "Document1")
    }

    @NSManaged public var neirong: String?
    @NSManaged public var name: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var size: Int64

}
