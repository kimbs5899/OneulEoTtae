//
//  AlrmData+CoreDataProperties.swift
//  OneulEoTtae
//
//  Created by Matthew on 3/1/24.
//
//

import Foundation
import CoreData


extension AlrmData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AlrmData> {
        return NSFetchRequest<AlrmData>(entityName: "AlrmData")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var setTime: String?
    @NSManaged public var location: WeatherData?
    @NSManaged public var dayOfWeek: NSSet?

}

// MARK: Generated accessors for dayOfWeek
extension AlrmData {

    @objc(addDayOfWeekObject:)
    @NSManaged public func addToDayOfWeek(_ value: DateData)

    @objc(removeDayOfWeekObject:)
    @NSManaged public func removeFromDayOfWeek(_ value: DateData)

    @objc(addDayOfWeek:)
    @NSManaged public func addToDayOfWeek(_ values: NSSet)

    @objc(removeDayOfWeek:)
    @NSManaged public func removeFromDayOfWeek(_ values: NSSet)

}

extension AlrmData : Identifiable {

}
