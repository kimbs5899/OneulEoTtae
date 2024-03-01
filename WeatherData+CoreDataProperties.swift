//
//  WeatherData+CoreDataProperties.swift
//  OneulEoTtae
//
//  Created by Matthew on 3/1/24.
//
//

import Foundation
import CoreData


extension WeatherData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherData> {
        return NSFetchRequest<WeatherData>(entityName: "WeatherData")
    }

    @NSManaged public var prevWeather: String?
    @NSManaged public var location: AlrmData?

}

extension WeatherData : Identifiable {

}
