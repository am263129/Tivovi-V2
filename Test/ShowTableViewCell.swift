//
//  ShowTableViewCell.swift
//  Test
//
//  Created by Hodu on 11/24/19.
//  Copyright © 2019 Hodu. All rights reserved.
//

import UIKit

class ShowTableViewCell: UITableViewCell {

    
    @IBOutlet weak var borderContainerViw: UIView!
    @IBOutlet weak var expendshowView: UIView!
    @IBOutlet weak var expendButton: UIButton!
    @IBOutlet weak var borderview: UIView!
    @IBOutlet weak var borderConst: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var takephotoBtn: UIButton!
    @IBOutlet weak var garantidateBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var returnBtn: UIButton!
    @IBOutlet weak var commentsBtn: UIButton!
    
    var show = true
    var hide = false
    var isAnimated = true
    // All animations are done with the same length of duration --- 1.0 second
    let durationOfAnimationInSecond = 3.0
    let viewToAnimate = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        expendshowView.isHidden = true
        borderContainerViw.layer.cornerRadius = 20
        borderview.layer.cornerRadius = 5
        borderview.layer.masksToBounds = true
        borderContainerViw.layer.masksToBounds = true
        borderContainerViw.layer.borderWidth = 2
        borderContainerViw.layer.borderColor = UIColor(red:0/255, green:120/255, blue:125/255, alpha: 1).cgColor
        
        takephotoBtn.layer.cornerRadius = 5
        garantidateBtn.layer.cornerRadius = 5
        shareBtn.layer.cornerRadius = 5
        returnBtn.layer.cornerRadius = 5
        commentsBtn.layer.cornerRadius = 5
        expendButton.layer.cornerRadius = 5
                
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    @IBAction func expendButton(_ sender: UIButton) {
        
        if expendshowView.isHidden{
            UIView.animate(withDuration: 0.5){
                self.borderConst.constant = 2
                self.layoutIfNeeded()
                self.expendshowView.isHidden = false
            }
            sender.setImage(UIImage(named: "minusBtn"), for: UIControl.State.normal)
            showAnimation()
        }
        else{
            hideAll()
            UIView.animate(withDuration: 0.5){
                self.borderConst.constant = 30
                self.layoutIfNeeded()
                self.expendshowView.isHidden = true
            }
            sender.setImage(UIImage(named: "addBtn"), for: UIControl.State.normal)
        }

    }
func showAnimation() {
        
        perform(#selector(animate_photo), with: show, afterDelay: 1)
        perform(#selector(animate_garanti), with: show, afterDelay: 0.8)
        perform(#selector(animate_share), with: show, afterDelay: 0.6)
        perform(#selector(animate_return), with: show, afterDelay: 0.4)
        perform(#selector(animate_comments), with: show, afterDelay: 0.2)
       
    }
    func hideAll(){
        takephotoBtn.alpha = 0
        garantidateBtn.alpha = 0
        shareBtn.alpha = 0
        returnBtn.alpha = 0
        commentsBtn.alpha = 0
    }
    
    @objc func animate_photo(){

        UIView.animate(withDuration: 0.5){                self.takephotoBtn.alpha = 1
            }
        
    }
    @objc func animate_garanti(){

        UIView.animate(withDuration: 0.5){                self.garantidateBtn.alpha = 1
            }
        
    }
    @objc func animate_share(){

        UIView.animate(withDuration: 0.5){                self.shareBtn.alpha = 1
            }
        
    }
    @objc func animate_return(){
 
        UIView.animate(withDuration: 0.5){                self.returnBtn.alpha = 1
            }
        
    }
    @objc func animate_comments(){

        UIView.animate(withDuration: 0.5){                self.commentsBtn.alpha = 1
            }
        
    }
    
    func curveAnimation(view: UIView, animationOptions: UIView.AnimationOptions, isReset: Bool) {
      let defaultXMovement: CGFloat = 240
      UIView.animate(withDuration: durationOfAnimationInSecond, delay: 0, options: animationOptions, animations: {
        view.transform = isReset ? .identity : CGAffineTransform.identity.translatedBy(x: defaultXMovement, y: 0)
     
        
      }, completion: nil)
    }
    
    func transitionAnimation(view: UIView, animationOptions: UIView.AnimationOptions, isReset: Bool) {
      UIView.transition(with: view, duration: durationOfAnimationInSecond, options: animationOptions, animations: {
        view.alpha = 1
      }, completion: nil)
    }
}


extension UIView {
    func height (constant: CGFloat){
        setConstraint(value: constant, attribute: .height)
    }
    
    func width (constant: CGFloat ){
        setConstraint(value: constant, attribute : .width)
    }
    
    private func removeConstraint( attribute: NSLayoutConstraint.Attribute){
        constraints.forEach{
            if $0.firstAttribute == attribute{
                removeConstraint($0)
            }
        }
    }
    
    private func setConstraint(value: CGFloat, attribute: NSLayoutConstraint.Attribute){
        
        removeConstraint(attribute : attribute)
        let constrait =
            NSLayoutConstraint(item: self,
                               attribute: attribute,
                               relatedBy: NSLayoutConstraint.Relation.equal,
                               toItem: nil,
                               attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                               multiplier: 1,
                               constant: value)
        self.addConstraint(constrait)
        
    }
}


