//
//  NextPageViewController.swift
//  PastValuePractice
//
//  Created by Sylvia Jia Fen  on 2019/8/20.
//  Copyright © 2019 Sylvia Jia Fen . All rights reserved.
//

import UIKit

class NextPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        setUpText()
        setUpBtn()
    }
    
    let cellStringTextField = UITextField()
    
    let button = UIButton()
    
    func setUpText() {
        
        view.addSubview(cellStringTextField)
        
        cellStringTextField.font = UIFont.systemFont(ofSize: 15)
        cellStringTextField.borderStyle = UITextField.BorderStyle.roundedRect
//        cellStringTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        cellStringTextField.keyboardType = UIKeyboardType.default
//        cellStringTextField.returnKeyType = UIReturnKeyType.done
//        cellStringTextField.clearButtonMode = UITextField.ViewMode.whileEditing
//        cellStringTextField.autocorrectionType = UITextAutocorrectionType.no
        
        cellStringTextField.translatesAutoresizingMaskIntoConstraints = false
        
        cellStringTextField.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        
        let xCons = NSLayoutConstraint(
            item: cellStringTextField,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerX,
            multiplier: 1, constant: 0)
        
        let widthCons = NSLayoutConstraint(
            item: cellStringTextField,
            attribute: .width,
            relatedBy: .equal,
            toItem: view,
            attribute: .width,
            multiplier: 2/3, constant: 0)
        
        let heightCons = NSLayoutConstraint(
            item: cellStringTextField,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1, constant: 40)
    
        NSLayoutConstraint.activate([xCons, widthCons, heightCons])
        
    }
    
    func setUpBtn() {
        
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        button.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -20).isActive = true
        
        button.backgroundColor = .black
        button.setTitle("button", for: .normal)
        
        button.addTarget(self, action: #selector(backToFirstPage), for: .touchUpInside)
    }
    
    @objc func backToFirstPage() {
        navigationController?.popViewController(animated: true)
        
        self.delegate?.textFromNextPage(self)
        
        self.delegateFromCell?.setTextInCell(self, textField: self.cellStringTextField)
        
    }
    
    // 以 closure 方式實作傳值
    
    
    // 以 delegate pattern 方式實作傳值
    weak var delegate: NextPageViewControllerDelegate?
    
    weak var delegateFromCell: NextPageViewControllerDelegate?

}

protocol NextPageViewControllerDelegate: AnyObject {
    
    func textFromNextPage(_ page: NextPageViewController)
    
    func setTextInCell(_ page: NextPageViewController, textField: UITextField)
    
}
