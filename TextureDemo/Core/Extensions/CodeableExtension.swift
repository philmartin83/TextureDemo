//
//  JSONCodeableExtension.swift
//  PrivacySDK
//
//  Created by Phil Martin on 09/09/2019.
//  Copyright © 2019 Phil Martin. All rights reserved.
//

import Foundation
import RxSwift

extension JSONDecoder{
    
    func decoderWithURLString<T: Decodable> (_ type: T.Type, fromURL url: String) -> (Observable<T>){
        let url = URL(string: url)
        return Observable.create { (observer) -> Disposable in
            // we can force unwrap the url  here becasue the URL should never be wrong if it is we need to crash or you could add a 'fatalError' and return a message
            let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
                // if the response is good then decode to our object else return the error
                if let error = error{
                    observer.onError(error)
                }
                if let data = data, statusCode >= 200 && statusCode < 300{
                    do {
                        // try to decode the response.
                        let result = try JSONDecoder().decode(type, from: data)
                        // send back the good stuff :)
                        observer.onNext(result)
                        observer.onCompleted()
                        
                    } catch let error{
                        observer.onError(error)
                        observer.onCompleted()
                    }
                }

            }
            task.resume()
            return Disposables.create {
//                task.cancel()
            }
        }
    }
    
    func decoderWithRequest<T: Decodable> (_ type: T.Type, fromURLRequest urlRequest: URLRequest) -> (Observable<T>){
        // use the passed in URLRequest to make communication with the server, all the requred headers should be added prior to call this fucntion
        return Observable.create { (observer) -> Disposable in
            
            let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                // get our response status code
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
                // if the response is good then decode to our object else return the error
                if let error = error{
                    observer.onError(error)
                    observer.onCompleted()
                }
                if let data = data, statusCode == 200{
                    do {
                        // try to decode the repsonse
                        let result = try JSONDecoder().decode(type, from: data)
                        // send back the good stuff :)
                        observer.onNext(result)
                        observer.onCompleted()
                        
                   // send back the object on completion
                    } catch let error{
                        // if the try fails send the error (Can be used in an UIAlertController keeping UI away from networking :) )
                        observer.onError(error)
                        observer.onCompleted()
                  
                    }
                }
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
