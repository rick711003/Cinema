//
//  TMDBService.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 19/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation
import Alamofire

public struct TMDBService {
    
    private let baseURL = "https://api.themoviedb.org/3/"
    private let discoverPath = "discover/movie"
    private let moviePath = "movie/"
    private let apiKey = "328c283cd27bd1877d9080ccb1604c91"
    private let primaryReleaseDateLte = "2016-12-31"
    private let sortBy = "release_ date.desc"
    
    public init() {}
    
    func getDiscover(page: Int) {
        let urlString = baseURL + discoverPath
        let parameters: Parameters = ["api_key": apiKey,
                                      "primary_release_date.lte": primaryReleaseDateLte,
                                      "sort_by": sortBy,
                                      "page": page]
        
        Alamofire.AF.request(urlString, parameters:parameters).responseJSON { response in
            let decoder = JSONDecoder()
            print(response)
            let decoderData: Result<Discover> = decoder.decodeResponse(from: response)
            if decoderData.isSuccess, let discover = decoderData.value {
                print (discover)
            } else {
                print ("error")
            }
        }
    }
    
    func getMovie(movieId: Int) {
        let urlString = baseURL + moviePath + String(movieId)
        let parameters: Parameters = ["api_key": apiKey]
        
        Alamofire.AF.request(urlString, parameters:parameters).responseJSON { response in
            let decoder = JSONDecoder()
            print(response)
            let movieData: Result<Movie> = decoder.decodeResponse(from: response)
            if movieData.isSuccess, let movie = movieData.value {
                print (movie)
            } else {
                print ("error")
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
            print("didn't get any data from API")
            return .failure(response.error!)
        }
        
        do {
            let item = try decode(T.self, from: responseData)
            return .success(item)
        } catch {
            print("error trying to decode response")
            print(error)
            return .failure(error)
        }
    }
}
