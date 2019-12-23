//
//  Article.swift
//  GoodNewsMVVM
//
//  Created by Agnes Lo on 2019/12/23.
//  Copyright © 2019 Agnes Lo. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
    
    let articles: [Article]
}

struct Article: Decodable {
    
    let title: String
    let description: String
}
