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

    @NSManaged public var monday: String?
    @NSManaged public var tuesday: String?
    @NSManaged public var wednesday: String?
    @NSManaged public var thursday: String?
    @NSManaged public var friday: String?
    @NSManaged public var saturday: String?
    @NSManaged public var sunday: String?
    @NSManaged public var dayList: AlrmData?

}

extension DateData : Identifiable {

}
