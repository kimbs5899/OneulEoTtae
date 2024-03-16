//
//  DateData+CoreDataProperties.swift
//  OneulEoTtae
//
//  Created by Matthew on 3/1/24.
//
//

import Foundation
import CoreData


extension DateData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DateData> {
        return NSFetchRequest<DateData>(entityName: "DateData")
    }

    @NSManaged public var monday: Bool
    @NSManaged public var tuesday: Bool
    @NSManaged public var wednesday: Bool
    @NSManaged public var thursday: Bool
    @NSManaged public var friday: Bool
    @NSManaged public var saturday: Bool
    @NSManaged public var sunday: Bool
    @NSManaged public var dayList: AlrmData?

}

extension DateData : Identifiable {

}
