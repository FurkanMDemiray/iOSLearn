//
//  NetworkOperation.swift
//
//
//  Created by Kerim Çağlar on 24.04.2024.
//

import Foundation
import Alamofire

fileprivate enum NetworkConstants {
    static let unauthorizedCode = 401
}

public enum OperationState: String {
    case ready
    case executing
    case finished
    case none
}

public protocol NetworkOperationProtocol: AnyObject {
    var operationState: OperationState { get set }
}

open class NetworkOperation<T, M>: Operation, NetworkOperationProtocol where T: Decodable, M: Encodable {
    
    //HW: willset, didSet nedir örneklerle açıklayınız
    open var operationState: OperationState = .none {
        willSet {
            willChangeValue(forKey: newValue.rawValue)
        }
        
        didSet {
            didChangeValue(forKey: operationState.rawValue)
        }
    }
    
    open lazy var session: Session = {
        let configuration = URLSessionConfiguration.af.default
        let session = Session(configuration: configuration)
        return session
    }()
    
    open var request: BaseRequest
    open var requestModel: M?
    open var completion: ((Result<T, Error>) -> Void)?
    open lazy var jsonDecoder: JSONDecoder = {
       
        let decoder: JSONDecoder = JSONDecoder()
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
        
    }()
    
    public init(
        request: BaseRequest,
        requestModel: M?,
        completion: ((Result<T, Error>) -> Void)? = nil
    ) {
        self.operationState = .none
        self.request = request
        self.requestModel = requestModel
        self.completion = completion
    }
    
    open override func start() {
        if (NetworkReachabilityManager.default?.isReachable ?? true) == false {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                if self.request.showAlertWhenError {
                    NetworkError.showAlert(with: .connectionError)
                }
                self.completion?(Result.failure(NetworkError.connectionError))
                self.operationState = .finished
            }
        } else if !isExecuting {
            operationState = .executing
            performRequest()
        }
    }
    
    open override var isReady: Bool {
        operationState == .ready
    }
    
    open override var isExecuting: Bool {
        operationState == .executing
    }
    
    open override var isFinished: Bool {
        operationState == .finished
    }
    
    open override var isAsynchronous: Bool {
        return true
    }
}

extension NetworkOperation {
    public func performRequest() {
        print("************* REQUEST URL: \(request.urlString) ****************** ")
        print("************* REQUEST PARAMS: \(String(describing: requestModel)) **************")
        
        let req: DataRequest! = performDataRequest()
        
        let emptyResponseCodes: Set<Int> = [201, 204, 205]
        
        let serializer = DataResponseSerializer(
            dataPreprocessor: DataResponseSerializer.defaultDataPreprocessor,
            emptyResponseCodes: emptyResponseCodes,
            emptyRequestMethods: DataResponseSerializer.defaultEmptyRequestMethods
        )
        
        req.response(queue: DispatchQueue.main, responseSerializer: serializer) { [weak self] response in
            guard let self else { return }
            self.handleResponse(response: response)
        }
        
    }
    
    public func performDataRequest() -> DataRequest {
        
        let req = session.request(
            request.urlString,
            method: request.httpMethod,
            parameters: requestModel,
            encoder: JSONParameterEncoder.default,
            headers: request.headers
        )
        
        return req
    }
    
    public func handleResponse(response: DataResponse<Data, AFError>) {
        print("Status Code: \(String(describing: response.response?.statusCode)), error: \(String(describing: response.error?.errorDescription))")
        
        switch response.response?.statusCode ?? 500 {
            
        case 200..<299: //Success with data or empty
            self.handleResponse(data: response.data)
            
        default: //Network or Service Errors
            let errorStr = createErrorStr(response: response)
            self.handleError(
                data: response.data,
                error: response.error,
                code: response.response?.statusCode ?? 500,
                errorStr: errorStr
            )
            
        }
    }
    
    public func createErrorStr(response: DataResponse<Data, AFError>) -> String {
        var str = ""
        
        if let errData = response.data {
            
        }
        
        return str
    }
    
    public func handleResponse(data: Data?) {
        
        if let data {
            print("*********** SUCCESS: \(String(decoding: data, as: UTF8.self)) ************")
            
            do {
                let decodedObject = try jsonDecoder.decode(T.self, from: data)
                completion?(Result.success(decodedObject))
                operationState = .finished
            } catch {
                let err = AFError.responseSerializationFailed(reason: .decodingFailed(error: error))
                print("******* ERROR PARSING: \(err)")
                completion?(Result.failure(err))
                operationState = .finished
            }
        } else {
            print("******* EMPTY SUCCESS ******")
            completion?(Result.success(BaseResponse() as! T))
            operationState = .finished
        }
        
    }
    
    //Failed Result
    public func handleError(
        data: Data?,
        error: AFError?,
        code: Int,
        errorStr: String
    ) {
        
        if let data {
            print("******** RESULT: Custom error response : \(String(decoding: data, as: UTF8.self))")
            
            do {
                let decodedObject = try jsonDecoder.decode(ServiceError.self, from: data)
                let serviceError = NetworkError.serviceError(decodedObject)
                
                if self.request.showAlertWhenError {
                    if code >= 500 {
                        NetworkError.showAlert(with: NetworkError.operationFailed)
                    } else {
                        
                        if decodedObject.errorKey == "already_exist_email" {
                            // TODO: show alert
                        } else {
                            NetworkError.showAlert(with: serviceError)
                        }
                    }
                    
                    completion?(Result.failure(serviceError))
                    operationState = .finished
                }
            } catch {
                let err = AFError.responseSerializationFailed(reason: .decodingFailed(error: error))
                print("***** RESULT: Error json parse : \(err)")
                completion?(Result.failure(err))
                operationState = .finished
            }
        } else {
            print("***** RESULT: Error: \(String(describing: error))")
            if self.request.showAlertWhenError {
                NetworkError.showAlert(with: .operationFailed)
            }
            
            completion?(Result.failure(NetworkError.operationFailed))
            operationState = .finished
        }
        
    }
}
