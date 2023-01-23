//
//  PonsErrors.swift
//  ChinesePictureFlashCards
//
//  Created by ian robert blair on 2022/2/15.
//

import Foundation

enum PonsErrors:Error {
    case error204
    case error404
    case error403
    case error500
    case error503
    case unknownError
}

extension PonsErrors:LocalizedError {
    public var localizedDescription:String? {
        switch self {
        case .error204:
            return NSLocalizedString("ERROR 204: NO CONTENT", comment: "Normal condition (no results could be found)")
        case .error404:
            return NSLocalizedString("ERROR 404: NOT FOUND", comment: "The dictionary does not exist")
        case .error403:
            return NSLocalizedString("ERROR 403: NOT AUTHORIZED", comment: "The supplied credentials could not be verified.  The access to a dictionary is not allowed.")
        case .error500:
            return NSLocalizedString("ERROR 500: INTERNAL SERVER ERROR", comment: "An internal error has occurred.")
        case .error503:
            return NSLocalizedString("ERROR 503: SERVICE UNAVAILABLE", comment: "The daily limit has been reached.")
        case .unknownError:
            return NSLocalizedString("UKNOWN ERROR", comment: "Service is unavailable.")
        }
    }
}
