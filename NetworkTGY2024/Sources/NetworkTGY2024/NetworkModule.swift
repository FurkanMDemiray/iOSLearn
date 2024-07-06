//
//  NetworkModule.swift
//
//
//  Created by Kerim Çağlar on 24.04.2024.
//

import Foundation
import UIKit

public struct NetworkService {
    
    public static let shared = NetworkService()
    public init() {}
    public static var tokenRequestAvailable = false
    
    let operationQueue: OperationQueue = OperationQueue()
    
    public func add(_ operation: Operation & NetworkOperationProtocol) {
        operation.operationState = .ready
        operationQueue.addOperation(operation)
    }
    
}


public struct ServiceError: Codable {
    var errorKey: String?
    var title: String?
    var status: Int?
    var path: String?
}

public enum NetworkError: Error {
    
    public enum ErrorMessageConstants {
        static let defaultErrorMessage = "Geçici bir hata oluştu"
        static let defaultConnectionErrorMessage = "İnternet Bağlantınızı Kontrol Ediniz"
    }
    
    case operationFailed
    case connectionError
    case serviceError(ServiceError)
    case error(Error)
    
    public var message: String? {
        switch self {
        case .operationFailed:
            return ErrorMessageConstants.defaultErrorMessage
        case .connectionError:
            return ErrorMessageConstants.defaultConnectionErrorMessage
        case .serviceError(let serviceError):
            return serviceError.errorKey
        case .error(_):
            return ErrorMessageConstants.defaultErrorMessage
        }
    }
}

extension NetworkError {
    static func showAlert(with error: NetworkError) {
        let message = error.message ?? ErrorMessageConstants.defaultErrorMessage
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        guard let topController = UIApplication.shared.keyWindow?.rootViewController else { return }
        topController.present(alert, animated: true)
    }
}
