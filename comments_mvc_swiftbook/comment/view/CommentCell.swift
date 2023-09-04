//
//  CommentCell.swift
//  comments_mvc_swiftbook
//
//  Created by Nikita on 03.09.2023.
//

import UIKit

class CommentCell: UITableViewCell{
  @IBOutlet weak var lable: UILabel!
  @IBOutlet weak var textView: UITextView!
  
  func configure(with comment: Comment){
    self.lable.text = comment.name
    self.textView.text = comment.body
  }
}
