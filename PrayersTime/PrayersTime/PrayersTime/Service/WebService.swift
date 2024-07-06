//
//  WebService.swift
//  PrayersTime
//
//  Created by Melik Demiray on 12.05.2024.
//

import Foundation
import Alamofire

class WebService {

    static let shared = WebService()

    private init() { }

    let headers = [
        "content-type": "application/json",
        "authorization": "apikey 66Uqv46vcVQ15WGs9PA8Mc:6LimSK5ZiMvXT95VLMDca2"
    ]

    func fetchPrayersTime(city: String, completion: @escaping (Result<PrayersModel, Error>) -> Void) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.collectapi.com/pray/all?data.city=\(city)")! as URL,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        AF.request(request as URLRequest).responseDecodable(of: PrayersModel.self) { response in
            switch response.result {
            case .success(let prayers):
                completion(.success(prayers))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}


