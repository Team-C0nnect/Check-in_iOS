//
//  APIError.swift
//  Check-in
//
//  Created by dgsw8th16 on 11/28/23.
//

import Foundation

public enum ApiError: Error {
    case badRequest
    case forbidden
    case notFound
    case conflict
    case internalServerError
    case unknownError
}
