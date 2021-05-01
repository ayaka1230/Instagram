//
//  CommentData.swift
//  Instagram
//
//  Created by 長坂絢加 on 2021/05/01.
//

import UIKit
import Firebase

class CommentData: NSObject {
    // コメント投稿者の表示名
    var displayName: String?
    
    // コメントの内容
    var content: String?
    
    // コメントが投稿された日時
    var date: Date?
    
    init(comment: NSDictionary) {
        self.displayName = comment["displayName"] as? String
        self.content = comment["content"] as? String
        let timestamp = comment["date"] as? Timestamp
        self.date = timestamp?.dateValue()
    }
}
