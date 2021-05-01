//
//  PostData.swift
//  Instagram
//
//  Created by 長坂絢加 on 2021/05/01.
//

import UIKit
import Firebase

class PostData: NSObject {
    // 投稿ID（保存する際に作られたユニークなID）
    var id: String
    // 投稿者名
    var name: String?
    // キャプション
    var caption: String?
    // 日付
    var date: Date?
    // いいねをした人のIDの配列
    var likes: [String] = []
    // 自分がいいねしたかどうかのフラグ
    var isLiked: Bool = false
    
    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID
        
        let postDic = document.data()
        
        self.name = postDic["name"] as? String
        
        self.caption = postDic["caption"] as? String
        
        let timestamp = postDic["date"] as? Timestamp
        self.date = timestamp?.dateValue()
        
        if let likes = postDic["likes"] as? [String] {
            self.likes = likes
        }
        
        if let myid = Auth.auth().currentUser?.uid {
            // likes の配列の中に myid が含まれているかチェックすることで、自分がいいねを押しているかを判断
            if self.likes.firstIndex(of: myid) != nil {
                // myid があれば、いいねを押していると認識する
                self.isLiked = true
            }
        }
    }
}
