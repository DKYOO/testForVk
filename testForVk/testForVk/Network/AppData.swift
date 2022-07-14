//
//  JsonData.swift
//  testForVk
//
//  Created by Dmitry Kaveshnikov on 13/7/22.
//

import Foundation

struct NResponseRootModel: Codable {
    let body: ResponseModel
    let status: Int
}

struct ResponseModel: Codable {
    let services: [Services]
}

struct Services: Codable {
    let name: String
    let description: String
    let link: String
    let icon_url: String
}
