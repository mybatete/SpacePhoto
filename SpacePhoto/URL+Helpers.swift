//
//  URL+Helpers.swift
//  SpacePhoto
//
//  Created by Marc Batete on 12/1/19.
//  Copyright © 2019 Marc Batete. All rights reserved.
//

import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self,
        resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map
        { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
