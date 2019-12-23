//
//  WebService.swift
//  GoodNewsMVVM
//
//  Created by Agnes Lo on 2019/12/20.
//  Copyright © 2019 Agnes Lo. All rights reserved.
//

import Foundation

class WebService {
    
    func getArticle(url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if let error = error {
                
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if let articleList = articleList {
                    
                    completion(articleList.articles)
                }
                
                print(articleList?.articles)
            }
            }).resume()
    }
}
