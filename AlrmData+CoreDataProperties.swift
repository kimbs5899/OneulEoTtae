//
//  AlrmData+CoreDataProperties.swift
//  OneulEoTtae
//
//  Created by Matthew on 4/15/24.
//
//

import Foundation
import CoreData


extension AlrmData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AlrmData> {
        return NSFetchRequest<AlrmData>(entityName: "AlrmData")
    }

    @NSManaged public var friday: Bool
    @NSManaged public var id: UUID?
    @NSManaged public var isToggleOn: Bool
    @NSManaged public var location: String?
    @NSManaged public var monday: Bool
    @NSManaged public var saturday: Bool
    @NSManaged public var setTime: String?
    @NSManaged public var sunday: Bool
    @NSManaged public var thursday: Bool
    @NSManaged public var tuesday: Bool
    @NSManaged public var wednesday: Bool

}

extension AlrmData : Identifiable {

}
