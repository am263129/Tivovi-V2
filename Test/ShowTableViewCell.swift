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
    
    
    
    @IBOutlet weak var takephotoBtn: UIButton!
    @IBOutlet weak var garantidateBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var returnBtn: UIButton!
    @IBOutlet weak var commentsBtn: UIButton!
    
    
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
        expendshowView.isHidden = !expendshowView.isHidden

        

    
        

        if (!expendshowView.isHidden)
        {
            sender.setImage(UIImage(named: "minusBtn"), for: UIControl.State.normal)
            transitionAnimation(view: expendshowView, animationOptions: .autoreverse, isReset: expendshowView.isHidden)
        }
        else {
            sender.setImage(UIImage(named: "addBtn"), for: UIControl.State.normal)
            transitionAnimation(view: expendshowView, animationOptions: .autoreverse, isReset: expendshowView.isHidden)
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
//        view.backgroundColor = UIColor.init(named: isReset ? "lightblue" :  "darkred")
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


