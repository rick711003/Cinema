//
//  TMDBService.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 19/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation
import Alamofire

public class TMDBService {

    func getDiscover(page: Int, completion: @escaping (_ discover: Discover?, _ error: Error?) -> Void) {
        let urlString = Constants.baseURL + Constants.discoverPath
        let parameters: Parameters = [Constants.apiKeyFieldName: Constants.apiKey,
                                      Constants.primaryReleaseDateLetFieldName: Constants.primaryReleaseDateLte,
                                      Constants.sortByFieldName: Constants.sortBy,
                                      Constants.pageFieldName: page]
        
        Alamofire.AF.request(urlString, parameters:parameters).responseJSON { response in
            let decoder = JSONDecoder()
            let decoderData: Result<Discover> = decoder.decodeResponse(from: response)
            if decoderData.isSuccess, let discover = decoderData.value {
                completion(discover, nil)
            } else {
                completion (nil, response.error)
            }
        }
    }
    
    func getMovie(movieId: Int, completion: @escaping (_ discover: Movie?, _ error: Error?) -> Void) {
        let urlString = Constants.baseURL + Constants.moviePath + String(movieId)
        let parameters: Parameters = [Constants.apiKeyFieldName: Constants.apiKey]
        
        Alamofire.AF.request(urlString, parameters:parameters).responseJSON { response in
            let decoder = JSONDecoder()

            let movieData: Result<Movie> = decoder.decodeResponse(from: response)
            if movieData.isSuccess, let movie = movieData.value {
                completion(movie, nil)
            } else {
                completion (nil, response.error)
            }
        }
    }
}

private extension JSONDecoder {
    func decodeResponse<T: Decodable>(from response: DataResponse<Any>) -> Result<T> {
        guard response.error == nil else {
            print(response.error!)
            return .failure(response.error!)
        }
        
        guard let responseData = response.data else {
            return .failure(response.error!)
        }
        
        do {
            let item = try decode(T.self, from: responseData)
            return .success(item)
        } catch {
            return .failure(error)
        }
    }
}
