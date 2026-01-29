//
//  CoreDataManager.swift
//  WeatherApp
//
//  Created by rentamac on 1/28/26.
//
import Foundation
import CoreData
final class CoreDataManager {

    private let context =
        PersistenceController.shared.container.viewContext

    func insertLocation(name: String, latitude: Double, longitude: Double) {
        let entity = LocationEntity(context: context)
        entity.id = UUID()
        entity.name = name
        entity.latitude = latitude
        entity.longitude = longitude
        entity.temperature = 0
        entity.lastUpdated = nil
        save()
    }

    func fetchLocations() -> [LocationEntity] {
        let request: NSFetchRequest<LocationEntity> =
            LocationEntity.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(key: "name", ascending: true)
        ]
        return (try? context.fetch(request)) ?? []
    }

    func updateWeather(
        for location: LocationEntity,
        temperature: Double
    ) {
        location.temperature = temperature
        location.lastUpdated = Date()
        save()
    }

    private func save() {
        if context.hasChanges {
            try? context.save()
        }
    }
}

