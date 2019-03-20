//
//  TMDBService.swift
//  Cinema
//
//  Created by Chen, Rick (Agoda) on 19/3/2562 BE.
//  Copyright © 2562 Chen, Rick (Agoda). All rights reserved.
//

import Foundation
import Alamofire

private struct Constants {
    // request constants elemment
    static let apiKey = "328c283cd27bd1877d9080ccb1604c91"
    static let baseURL = "https://api.themoviedb.org/3/"
    static let imageBaseURL = "https://image.tmdb.org/t/p/w500"
    static let discoverPath = "discover/movie"
    static let moviePath = "movie/"
    static let sortBy = "release_ date.desc"
    static let primaryReleaseDateLte = "2016-12-31"
    // request field name
    static let apiKeyFieldName = "api_key"
    static let sortByFieldName = "sort_by"
    static let pageFieldName = "page"
    static let primaryReleaseDateLetFieldName = "primary_release_date.lte"
}

public struct TMDBService {

    func getDiscover(page: Int) {
        let urlString = Constants.baseURL + Constants.discoverPath
        let parameters: Parameters = [Constants.apiKeyFieldName: Constants.apiKey,
                                      Constants.primaryReleaseDateLetFieldName: Constants.primaryReleaseDateLte,
                                      Constants.sortByFieldName: Constants.sortBy,
                                      Constants.pageFieldName: page]
        
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
        let urlString = Constants.baseURL + Constants.moviePath + String(movieId)
        let parameters: Parameters = [Constants.apiKeyFieldName: Constants.apiKey]
        
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
