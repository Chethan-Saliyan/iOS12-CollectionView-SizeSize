//
//  ViewController.swift
//  IOS12Sample
//
//  Created by Chethan on 06/02/19.
//  Copyright © 2019 Chethan. All rights reserved.
//

import UIKit

enum TableItem:Int {
    case item1
    case item2
    case item3
    case item4
    case item5
    case item6
    case item7
    case item8
    case item9
    case item10
    case item11
    case item712
    case item13
    case item14
    case item15
    case count
    
    func getIdentifier() -> String {
        switch self {
        default:
            return "cellItem"
        }
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var activeTextField:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
          NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
     
    }

    @objc func keyboardWillShow(notification:NSNotification) {
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.tableView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        tableView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        tableView.contentInset = contentInset
    }
    @IBAction func buttonTapped(_ sender: Any) {
       if let selfSizeController = self.storyboard?.instantiateViewController(withIdentifier: "\(SelfSizeCollectionView.self)")  as? SelfSizeCollectionView {
            self.navigationController?.pushViewController(selfSizeController, animated: true)
        }
    }
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellType = TableItem(rawValue: indexPath.row) else {
            return UITableViewCell()
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellType.getIdentifier(), for: indexPath) as? ItemTableViewCell else {
              return UITableViewCell()
        }
        cell.textField.delegate = self
        cell.textField.tag = cellType.rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableItem.count.rawValue
    }
}

extension ViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
//        activeTextField?.resignFirstResponder()
//        activeTextField = nil
        let tag = textField.tag
        if(tag < TableItem.count.rawValue) {
            guard let cell = self.tableView.cellForRow(at: IndexPath.init(row: tag + 1, section: 0))  as? ItemTableViewCell else {
                activeTextField?.resignFirstResponder()
                activeTextField = nil
                return true
            }
            cell.textField.becomeFirstResponder()
        }
        else {
            activeTextField?.resignFirstResponder()
            activeTextField = nil
        }
        return true
    }
    
    
}

