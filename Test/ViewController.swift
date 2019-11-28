//
//  ViewController.swift
//  Test
//
//  Created by Hodu on 11/24/19.
//  Copyright © 2019 Hodu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
  
    
    @IBOutlet weak var tableView: UITableView!
    var imagePicker: ImagePicker!
    var ShowTableViewCell : ShowTableViewCell!
    enum Const {
        static let closeCellHeight: CGFloat = 200
        static let openCellHeight: CGFloat = 220
        static let rowsCount = 10
    }
    var blocks = [block]()
    var newBlock : block!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        initData()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 124
    }
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                 return 200
      }
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 3
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
          let cellIdentifier = "ShowTableViewCell"
               
               guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ShowTableViewCell  else {
                   fatalError("The dequeued cell is not an instance of MealTableViewCell.")
               }
        tableView.estimatedRowHeight = UITableView.automaticDimension
        cell.takephotoBtn.addTarget(self, action: #selector(takePhoto(_:)), for: .touchUpInside)
        cell.garantidateBtn.addTarget(self, action: #selector(selectGarantiDate(_:)), for: .touchUpInside)
        cell.commentsBtn.addTarget(self, action: #selector(makeComment(_:)), for: .touchUpInside)
        cell.returnBtn.addTarget(self, action: #selector(selectReturnDate(_:)), for: .touchUpInside)
        cell.shareBtn.addTarget(self, action: #selector(share(_ :)), for: .touchUpInside)
        return cell
      }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.endIndex == 1) {
            return  80
        }
        else {
            return 40
        }
    }
    @objc func takePhoto(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
        
    }
    
    @objc func selectGarantiDate(_ sender: UIButton) {
        
        let myDatePicker: UIDatePicker = UIDatePicker()
        myDatePicker.timeZone = NSTimeZone.local
        myDatePicker.frame = CGRect(x: 0, y: 15, width: 270, height: 200)
        
        let alertController = UIAlertController(title: "Select GarantiDate", message: "",         preferredStyle: UIAlertController.Style.alert)
        let oneWeek = UIAlertAction(title: "A Week", style: UIAlertAction.Style.default){(action) in}
        let oneMonth = UIAlertAction(title: "A Month", style: UIAlertAction.Style.default){(action) in }
        let oneYear = UIAlertAction(title: "A Year", style: UIAlertAction.Style.default){(action) in }
        let custom = UIAlertAction(title: "Custom",  style: UIAlertAction.Style.destructive){(action) in
            oneWeek.accessibilityElementsHidden = true
            oneMonth.accessibilityElementsHidden = true
            oneYear.accessibilityElementsHidden = true
        }
        alertController.addTextField{
            (UITextField) in UITextField.placeholder = "Garanti Date"
        }
        alertController.addAction(oneWeek)
        alertController.addAction(oneMonth)
        alertController.addAction(oneYear)
        alertController.addAction(custom)
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            
        }))
        alertController.addAction(UIAlertAction(title: "OK",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func share(_ sender: UIButton){
        "Date to Share".share()
    }
    
    @objc func selectReturnDate(_ sender: UIButton) {
            
            let myDatePicker: UIDatePicker = UIDatePicker()
            myDatePicker.timeZone = NSTimeZone.local
            myDatePicker.frame = CGRect(x: 0, y: 15, width: 270, height: 200)
            let alertController = UIAlertController(title: "Select Return Date", message: "", preferredStyle: UIAlertController.Style.alert)
            let oneWeek = UIAlertAction(title: "A Week", style: UIAlertAction.Style.default){(action) in }
            let oneMonth = UIAlertAction(title: "A Month", style: UIAlertAction.Style.default){(action) in }
            let oneYear = UIAlertAction(title: "A Year", style: UIAlertAction.Style.default){(action) in }
            let custom = UIAlertAction(title: "Custom",  style: UIAlertAction.Style.destructive){(action) in
                oneWeek.accessibilityElementsHidden = true
                oneMonth.accessibilityElementsHidden = true
                oneYear.accessibilityElementsHidden = true
            }
            alertController.addTextField{(UITextField) in UITextField.placeholder = "Return Date"}
            alertController.addAction(oneWeek)
            alertController.addAction(oneMonth)
            alertController.addAction(oneYear)
            alertController.addAction(custom)
            alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in  }))
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(_: UIAlertAction!) in }))
            self.present(alertController, animated: true, completion: nil)
        }
    
    
    @objc func makeComment(_ sender: UIButton) {
            let alertController = UIAlertController(title: "Add new Comments", message: nil, preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "Add", style: .default) { (_) in
               if let txtField = alertController.textFields?.first, let text = txtField.text {
                   print("Text==>" + text)
               }
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
            alertController.addTextField { (textField) in
               textField.placeholder = "Comments"
            }
            alertController.addAction(confirmAction)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
       }
    
    
    
    func initData(){
        
        
    }

}

extension ViewController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
    }
}

extension UIApplication {
    class var topViewController: UIViewController? { return getTopViewController() }
    private class func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController { return getTopViewController(base: nav.visibleViewController) }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController { return getTopViewController(base: selected) }
        }
        if let presented = base?.presentedViewController { return getTopViewController(base: presented) }
        return base
    }
}

extension Hashable {
    func share() {
        let activity = UIActivityViewController(activityItems: [self], applicationActivities: nil)
        UIApplication.topViewController?.present(activity, animated: true, completion: nil)
    }
}



