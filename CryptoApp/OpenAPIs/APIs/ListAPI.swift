//
// ListAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



open class ListAPI {
    /**
     get coins list
     
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getCoinsList(apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: [CoinItem]?,_ error: Error?) -> Void)) {
        getCoinsListWithRequestBuilder().execute(apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     get coins list
     - GET /coins/list
     - List all supported coins id, name and symbol (no pagination required) 
     - returns: RequestBuilder<[CoinItem]> 
     */
    open class func getCoinsListWithRequestBuilder() -> RequestBuilder<[CoinItem]> {
        let path = "/coins/list"
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        let url = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<[CoinItem]>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     get exchanges list with pagination
     
     - parameter perPage: (query) limit 
     - parameter page: (query) offset 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getExchanges(perPage: Int, page: Int, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: [ExchangeItem]?,_ error: Error?) -> Void)) {
        getExchangesWithRequestBuilder(perPage: perPage, page: page).execute(apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     get exchanges list with pagination
     - GET /exchanges
     - List all exchanges 
     - parameter perPage: (query) limit 
     - parameter page: (query) offset 
     - returns: RequestBuilder<[ExchangeItem]> 
     */
    open class func getExchangesWithRequestBuilder(perPage: Int, page: Int) -> RequestBuilder<[ExchangeItem]> {
        let path = "/exchanges"
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "per_page": perPage.encodeToJSON(), 
            "page": page.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<[ExchangeItem]>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
