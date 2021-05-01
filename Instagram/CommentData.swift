//
//  CommentData.swift
//  Instagram
//
//  Created by 長坂絢加 on 2021/05/01.
//

import UIKit

class CommentData: NSObject {
    // コメント投稿者のID
    var userId: String?
    
    // コメントの内容
    var content: String?
    
    // コメントが投稿された日時
    // var date: Date?
    
    override init() {
    }
}
