//
//  NewsListTableViewController.swift
//  GoodNewsMVVM
//
//  Created by Agnes Lo on 2019/12/19.
//  Copyright © 2019 Agnes Lo. All rights reserved.
//

import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListVM: ArticleListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    private func setup() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&from=2019-11-23&sortBy=publishedAt&apiKey=a71e711b76ed49f1b36a4445908129fb")!
        
        WebService().getArticle(url: url, completion: { [weak self] articles in
            
            guard let articles = articles else { return }
            
            self?.articleListVM = ArticleListViewModel(articles: articles)
            
            DispatchQueue.main.async {
                
                self?.tableView.reloadData()
            }
        })
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.articleListVM == nil ? 0 : self.articleListVM!.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.articleListVM == nil ? 0 : self.articleListVM!.numberOfRowsInSection(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ArticleTableViewCell.self), for: indexPath) as? ArticleTableViewCell else {
            
            fatalError("ArticleTableViewCell not found")
        }
        
        let articleVM = self.articleListVM?.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleVM?.title
        cell.descriptionLabel.text = articleVM?.description
        
        return cell
    }

}
