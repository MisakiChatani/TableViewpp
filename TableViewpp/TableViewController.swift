//
//  TableViewController.swift
//  TableViewpp
//
//  Created by 茶谷美咲 on 2020/09/07.
//  Copyright © 2020 Misaki Chatani. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var names:[String] = ["米倉","川田","金子","高橋","磯部","渋谷",]
    
    
    
    
//    addキーで配列を保存し、受け皿を作る処理
    var resultArray = [String]()
/*    配列を入れるタイミング、画面が戻ってきたら都度反映させる処理（リロードを押さなくてもいいように)
    viewWillAppear　その画面に来た時に何度も読み込んでくれる場所  */
    override func viewWillAppear(_ animated: Bool) {
        
//        もしビューコントロール側が空(nil)でないなら、resultArrayの中に保存したUserDefaultの中身を入れなさい
        if UserDefaults.standard.object(forKey: "add") != nil {
            resultArray = UserDefaults.standard.object(forKey: "add")
            as! [String]
        }
//        続いてリロードを入れる
        tableView.reloadData()
    }
    

//  アプリを立ち上げて最初の一回読み込まれる場所(viewDidLord)
    override func viewDidLoad() {
        super.viewDidLoad()
    
        print(names[3])
        names[3] = ("山田")
        print(names[3])
        
        names.append("加藤")
        print(names)
        
        names.insert("立川", at: 1)
        print(names)
        
        names.remove(at: 5)
        print(names)
        
        names.removeLast()
        print(names)
        
        names.removeAll()
        print(names)
        

    }

    // MARK: - Table view data source
    
//    セクションとは（一塊）　iPhoneの設定の通知〜スクリーンタイムまでがワンセクション
    
//    セルとは（その塊の中にある文字列）
    
    override func updateTextAttributes(conversionHandler: ([NSAttributedString.Key : Any]) -> [NSAttributedString.Key : Any]) {
    }
    
//    セクション名を決める所↓
//    今回はセクションを1にするのでreturn 0をreturn 1に変更

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

//    セルの数を指定する場所↓
/*    セルは配列分必要なので、動的に動かす時はreturn後に　names.countと設定
     ここで数字を指定してしまうと限られたセルしか表示されないのでNG
     
     受け皿分の数の受け皿を返す　resultArray.countにする必要がある
 */
 override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
    return resultArray.count
    }

//　　セルの表示する場所　↓
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        //        withIdentifier ここで先程指定したIdに変えてあげることでここに表示してくれる
        /*　ここのtableViewは上の関数で指定したUITableViewを指定している。
          dequeueReusableCell　はセルの場所を指定している命令文
        アイデンティファーのNameCellを一致させることで返している。
         */

        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
//        追加
//row は何番目を指定する場所(row番目)
//        name を　resultArrayに変更
        cell.textLabel?.text = resultArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
       if editingStyle == UITableViewCell.EditingStyle.delete {
            resultArray.remove(at: indexPath.row)
            UserDefaults.standard.set(resultArray, forKey: "add")
        tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
  
               }
        
        
        }
    }
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
