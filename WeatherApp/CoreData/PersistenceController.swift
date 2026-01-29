//
//  PersistenceController.swift
//  WeatherApp
//
//  Created by rentamac on 1/28/26.
//
import CoreData
final class PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer

    private init() {
        container = NSPersistentContainer(name: "WeatherDataModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
        }
    }
}
