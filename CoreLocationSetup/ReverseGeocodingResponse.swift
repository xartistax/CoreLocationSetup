//
//  ReverseGeocodingResponse.swift
//  CoreLocationSetup
//
//  Created by Demian Füglistaler on 17.12.2023.
//



import Foundation


struct ReverseGeocodingResponse: Codable {
    let response: GeocodingResponse
}

struct GeocodingResponse: Codable {
    let geocoding: GeocodingInfo
    let type: String
    let features: [ReverseGeocodingFeature]
    let bbox: [Double]?
}

struct GeocodingInfo: Codable {
    // Include properties as necessary
    let version: String
    // Add other properties as needed
}

struct ReverseGeocodingFeature: Codable {
    let type: String
    let geometry: Geometry
    let properties: ReverseGeoCodingProperties
}

struct Geometry: Codable {
    let type: String
    let coordinates: [Double]
}

struct ReverseGeoCodingProperties: Codable {
    let continent: String?
        let country: String?
        let country_a: String?
        let country_code: String?
        let region: String?
        let region_a: String?
        let county: String?
        let localadmin: String?
        let locality: String?
        let neighbourhood: String?
        let postalcode: String?
        let street: String?
        let housenumber: String?
        let name: String?
        let label: String?
        let layer: String?
        let distance: Float?
        let confidence: Float?
    // Add other properties as needed
}


