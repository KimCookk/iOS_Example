//
//  NetworkingClinet.swift
//  AlamofireExample
//
//  Created by 김태성 on 2023/02/14.
//

import Foundation
import Alamofire

class NetworkingClinet {
    static let shared = NetworkingClinet()
    private init() { }
    
    enum ServiceURL {
        case testGetURL, testPostURL, testPatchURL
        
        // https://gromit.shop
        var urlString: String {
            switch self {
            case .testGetURL:
                return "https://jsonplaceholder.typicode.com/posts"
            case .testPatchURL:
                return "https://jsonplaceholder.typicode.com/posts"
            case .testPostURL:
                return "https://jsonplaceholder.typicode.com/posts"
            }
        }
    }

    // 파라미터 존재하지 않는 경우
    func request<Output: Decodable>(serviceURL: ServiceURL, httpMethod: HTTPMethod, type: Output.Type, completion: @escaping ((String?, Output?)?, Error?) -> Void) {
        let urlString = serviceURL.urlString
        AF.request(urlString, method: httpMethod).response { responseData in
            switch responseData.result {
            case let .success(data):
                do {
                    if let decodingData = try self.decodeData(type, data: data) {
                        completion((responseData.debugDescription, decodingData), nil)
                    }
                }
                catch {
                    completion((responseData.debugDescription, nil), nil)
                }
            case let .failure(error):
                completion(nil, error)
            }
            sleep(5)
        }
    }
//
    // 파라미터가 존재하는 경우
    func request<Input: Encodable, Output: Decodable>(serviceURL: ServiceURL, httpMethod: HTTPMethod, parameter: Input, type: Output.Type, completion: @escaping ((String?, Output?)?, Error?) -> ()) {
        let urlString = serviceURL.urlString
        AF.request(urlString, method: httpMethod, parameters: parameter, encoder: .json()).response { responseData in
            switch responseData.result {
            case let .success(data):
                do {
                    if let decodingData = try self.decodeData(type, data: data) {
                        completion((responseData.debugDescription, decodingData), nil)
                    }
                }
                catch {
                    completion((responseData.debugDescription, nil), nil)
                }
            case let .failure(error):
                completion(nil, error)
            }
            sleep(5)
        }
    }
    
    private func decodeData<Output: Decodable>(_ type: Output.Type, data: Data?) throws -> Output? {
        guard let data = data else {
            return nil
        }
        do {
            let decoder = JSONDecoder()
            let decodingData = try decoder.decode(type, from: data)
            return decodingData
        }
        catch {
            return nil
        }
    }
    
}

