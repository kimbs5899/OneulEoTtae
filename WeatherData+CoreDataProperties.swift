//
//  WeatherData+CoreDataProperties.swift
//  OneulEoTtae
//
//  Created by 윤진영 on 3/17/24.
//
//

import Foundation
import CoreData


extension WeatherData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherData> {
        return NSFetchRequest<WeatherData>(entityName: "WeatherData")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var prevWeather: String?
    @NSManaged public var location: AlrmData?

}

extension WeatherData : Identifiable {

}
