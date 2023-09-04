//
//  GetCommentResponse.swift
//  comments_mvc_swiftbook
//
//  Created by Nikita on 03.09.2023.
//

import Foundation

struct GetCommentResponse {
  typealias JSON = [String: AnyObject]
  let comments: [Comment]
  
  init(json: Any) throws {
    guard let array = json as? [JSON] else { throw NetworkError.failInternerError}
    
    var comments = [Comment]()
    for dictionary in array {
      guard let comment = Comment(dict: dictionary) else {continue}
      comments.append(comment)
    }
    
    self.comments = comments
  }
}
