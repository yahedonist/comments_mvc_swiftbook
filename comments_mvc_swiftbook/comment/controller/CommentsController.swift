//
//  ViewController.swift
//  comments_mvc_swiftbook
//
//  Created by Nikita on 03.09.2023.
//

import UIKit

class CommentsViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  var comments = [Comment]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    CommentNetworkService.getComments {(response) in
      self.comments = response.comments
      self.tableView.reloadData()
    }
  }


}

// extension позволяет добавлять новые возможности к существующему типу
extension CommentsViewController: UITableViewDelegate {}

extension CommentsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommentCell
    let comment = comments[indexPath.row]
    cell.configure(with: comment)
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    return comments.count
  }
}
