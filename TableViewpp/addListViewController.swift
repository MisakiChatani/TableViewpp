//
//  addListViewController.swift
//  TableViewpp
//
//  Created by 茶谷美咲 on 2020/09/07.
//  Copyright © 2020 Misaki Chatani. All rights reserved.
//

import UIKit

class addListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var addText: UITextField!
    var array = [String]()
    
    
    @IBAction func addButton(_ sender: Any) {
        if UserDefaults.standard.object(forKey: "add") != nil {
            
//            保存されている値をarrayの中に再度格納する
                   array = UserDefaults.standard.object(forKey: "add")
                   as! [String]
        
        print(array)
        
    
        
//        addtextの中に配列を格納したい場合
//        空のarrayを指定したい場合は、nilで！を忘れない
        array.append(addText.text!)
/*        格納後に保存したい場合
        UserDefaults.standard.setはデフォルト　　鍵をつける
       (保存したいもの, forKey:kagi)  */
        UserDefaults.standard.set(array, forKey: "add")
        
        
//        保存をしたら前の画面に戻る　と指定したいとき
        self.navigationController?.popViewController(animated: (true))
//        ナビゲーションコントロールで戻る時は　↑ 、ナビゲーションコントロールを使わない場合（Buttonで飛ぶ等）は別の文章になる
        
        
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
}

