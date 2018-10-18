//
//  iOSTableViewController.swift
//  TableViewAnimation
//
//  Created by iOS on 2017/6/8.
//  Copyright © 2017年 iOS. All rights reserved.
//

import UIKit

class iOSTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //重载数据
        tableView.reloadData()
        //动画延时
        let diff = 0.05
        //获取tableView的高
        let tableHeight = self.tableView.bounds.size.height
        //获取所有单元格
        let cells:[UITableViewCell] = self.tableView.visibleCells as [UITableViewCell]
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0,y: tableHeight)
        }
        //遍历cell，顺序执行上移的动画
        for i in 0..<cells.count {
            let cell:UITableViewCell = cells[i] as UITableViewCell
            let delay = diff * Double(i)
            //执行动画
            UIView.animate(withDuration: 1, delay: delay, options: UIViewAnimationOptions.curveEaseOut, animations: {
                //重新回到原始位置
                cell.transform =  CGAffineTransform(translationX: 0,y: 0)
            }, completion: nil)
            
            
        }
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = "大标题:\(indexPath.row)"
        cell.detailTextLabel?.text = "子标题:\(indexPath.row)"
        // Configure the cell...

        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
