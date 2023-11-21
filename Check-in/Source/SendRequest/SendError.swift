//
//  SendError.swift
//  Check-in
//
//  Created by dgsw8th16 on 11/21/23.
//

import Foundation

enum SendError: Error {
    case forbidden
    case notFound
    case conflict
    case internalServerError
    case unknownError
}
