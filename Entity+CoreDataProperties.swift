//
//  Entity+CoreDataProperties.swift
//  7 Project
//
//  Created by 변창원 on 9/13/24.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var memo: String?
    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var color: String?
    @NSManaged public var check: String?
    @NSManaged public var time: Int16
    @NSManaged public var sidescreen: String?
    @NSManaged public var restoration: Bool


}

extension Entity : Identifiable {

}
