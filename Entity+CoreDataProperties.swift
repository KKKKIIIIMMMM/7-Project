//
//  Entity+CoreDataProperties.swift
//  7 Project
//
//  Created by 김동준 on 9/6/24.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var name: String?
    @NSManaged public var memo: String?
    @NSManaged public var id: UUID?

}

extension Entity : Identifiable {

}
