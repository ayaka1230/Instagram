//
//  CommentViewController.swift
//  Instagram
//
//  Created by 長坂絢加 on 2021/05/01.
//

import UIKit
import Firebase

class CommentViewController: UIViewController {
    
    var postDataId: String!
    
    @IBOutlet weak var contentTextView: UITextView!
    
    @IBAction func handleCommentButton(_ sender: Any) {
        let date = Date()
        // comments を更新する
        // 表示名を取得してTextFieldに設定する
        let user = Auth.auth().currentUser
        if let user = user {
            let newComment = [
                "displayName": user.displayName ?? "名無しさん",
                "content": self.contentTextView.text!,
                "date": date,
            ] as [String: Any]
            // 更新データを作成する
            let updateValue: FieldValue = FieldValue.arrayUnion([newComment])

            // comments に更新データを書き込む
            let postRef = Firestore.firestore().collection(Const.PostPath).document(postDataId)
            postRef.updateData(["comments": updateValue])
            
            // 画面を閉じる
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func handleCancelButton(_ sender: Any) {
        // 画面を閉じる
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
