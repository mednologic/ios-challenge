//
//  PersistenceManager.swift
//  iOS-Challenge
//
//  Created by josepL on 30/3/25.
//

import Foundation

enum PersistenceFile: String {
    case favorites = "Favorites.json"
}

final class PersistenceManager {
    static let shared = PersistenceManager()

    private init() {}

    private func fileURL(for file: PersistenceFile) -> URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(file.rawValue)
    }

    func save<T: Codable>(_ object: T, to file: PersistenceFile) async throws {
        let data = try EncoderJSON.shared.encodeToJSON(object)
        try data.write(to: fileURL(for: file), options: .atomicWrite)
    }

    func addToPersistence<T: Codable & Equatable>(_ object: T, to file: PersistenceFile) async throws {
        var collection: [T] = []
        do {
            collection = try await load(from: file, as: [T].self)
        } catch {
            collection = []
        }
        if !collection.contains(object) {
            collection.append(object)
            try await save(collection, to: file)
        }
    }

    func removeToPersistence<T: Codable & Equatable>(_ object: T, from file: PersistenceFile) async throws {
        var collection: [T] = []
        do {
            collection = try await load(from: file, as: [T].self)
        } catch {
            collection = []
        }
        if let index = collection.firstIndex(of: object) {
            collection.remove(at: index)
            try await save(collection, to: file)
        }
    }

    func isOnPersistence<T: Codable & Equatable>(_ object: T, in file: PersistenceFile) async throws -> Bool {
        do {
            let collection = try await load(from: file, as: [T].self)
            return collection.contains(object)
        } catch {
            return false
        }
    }

    func load<T: Codable>(from file: PersistenceFile, as type: T.Type) async throws -> T {
        let data = try Data(contentsOf: fileURL(for: file))
        do {
            let object = try JSONDecoder().decode(T.self, from: data)
            return object
        } catch let error as DecodingError {
            throw DecoderJSONError.decodingError(error)
        } catch {
            throw DecoderJSONError.noContent
        }
    }
}
