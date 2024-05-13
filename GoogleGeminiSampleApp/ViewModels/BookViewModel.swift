//
//  BookViewModel.swift
//  GoogleGeminiSampleApp
//
//  Created by Aashutosh Shrestha on 5/13/24.
//

import Foundation
import Alamofire
class BookViewModel: ObservableObject{
    @Published var booksResponse: GoogleBooksResponse?
    @Published var isLoading = false
    @Published var error: Error? = nil
    

    init() {
        
    }
    func fetchBooks(searchTerm: String){
        isLoading = true
        guard let url = URL(string: Constants.googleBooksAPIEndPoint(searchTerm: searchTerm)) else {
            fatalError("Invalid URL")
        }
        AF.request(url, method: .get, encoding: URLEncoding.default, headers: nil, interceptor: nil)
                .response{ resp in
                    switch resp.result{
                      case .success(let data):
                        do{
                          let jsonData = try JSONDecoder().decode(GoogleBooksResponse.self, from: data!)
                            self.booksResponse = jsonData
                          print(jsonData)
                       } catch {
                           print(resp)
                          print(error.localizedDescription)
                       }
                     case .failure(let error):
                        print(resp.data as Any)
                       print(error.localizedDescription)
                     }
                }
        
    }
}

