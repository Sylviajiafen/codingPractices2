//
//  FirstPageViewController.swift
//  PastValuePractice
//
//  Created by Sylvia Jia Fen  on 2019/8/20.
//  Copyright © 2019 Sylvia Jia Fen . All rights reserved.
//

import UIKit

class FirstPageViewController: UIViewController {

    @IBOutlet weak var firstPageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstPageTableView.dataSource = self
        firstPageTableView.delegate = self
        
        setUpNavigation()
        
    }
    
    var selectedIndex: Int?
    
    var stringArr: [String] = ["2", "3", "4", "5"]
    
    func setUpNavigation() {
        self.navigationItem.rightBarButtonItem?.target = self
        self.navigationItem.rightBarButtonItem?.action = #selector(showNextPage)
    }
    
    @objc func showNextPage() {
        
        let nextPage = NextPageViewController()
        
        nextPage.delegate = self
        show(nextPage, sender: nil)
    }
    

}


extension FirstPageViewController: UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return stringArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell =
            firstPageTableView.dequeueReusableCell(withIdentifier: "FirstPageTableViewCell", for: indexPath)
            as? FirstPageTableViewCell
            else { return UITableViewCell()}
        
        cell.delegate = self
        
        cell.stringLabel.text = stringArr[indexPath.row]
        
        // 以 Target-Action (Target 請設定為 UIViewController) 方式實作刪除 cell
        cell.deleteBtn.tag = indexPath.row
        // cell.deleteBtn.addTarget(self, action: #selector(deleteCell(sender:)), for: .touchUpInside)

        // 以 closure 的方式方式實作刪除 cell
        cell.selectedCell = { [weak self] cell in
            
            guard let index = self?.firstPageTableView.indexPath(for: cell) else {return}
            
            self?.stringArr.remove(at: index.row)
            
            self?.firstPageTableView.deleteRows(at: [index], with: .right)
            
            
        }
        
        return cell
    }
    
    
    @objc func deleteCell(sender: UIButton) {
        
        stringArr.remove(at: sender.tag)
        
        // 若呼叫 tableView 的 deleteRowsAt 方法，必須 reloadData()，否則點選較下方的 cell 會 index out of range (因為其 index 被更新了)
        
        firstPageTableView.reloadData()
    
    }
}

extension FirstPageViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextPage = NextPageViewController()
        
        nextPage.cellStringTextField.text = stringArr[indexPath.row]
        
        nextPage.delegateFromCell = self
        
        selectedIndex = indexPath.row
        
        show(nextPage, sender: nil)
        
    }
    
}

// 以 delegate 方式實作刪除 cell
extension FirstPageViewController: FirstPageTableViewCellDelegate {
    
    func userDidPressedDelete(_ cell: FirstPageTableViewCell) {

//        guard let toBeRemovedCellIndex = firstPageTableView.indexPath(for: cell) else {return}
//
//        stringArr.remove(at: toBeRemovedCellIndex.row)
//
//        firstPageTableView.deleteRows(at: [toBeRemovedCellIndex], with: .fade)
    }
    
}

// 以 delegate 方式實作改變 cell 文字 / 新增 cell 並設定文字
extension FirstPageViewController: NextPageViewControllerDelegate {
    
    func textFromNextPage(_ page: NextPageViewController) {
        
        guard let nextTextString = page.cellStringTextField.text else {return}
        
        stringArr.append(nextTextString)
        
        firstPageTableView.reloadData()
       
    }
    
    func setTextInCell(_ page: NextPageViewController, textField: UITextField) {
        
        guard let selectedIndex = selectedIndex else { return }
        
        stringArr[selectedIndex] = textField.text ?? ""
        
        firstPageTableView.reloadData()
    }
    
    
    
}
