//
//  BNMenuViewController.swift
//  BNMenuView
//
//  Created by SGMobile on 31/12/18.
//  Copyright © 2018 Bijesh. All rights reserved.
//

import UIKit

public protocol BNMenuDelegate: class  {
    func clickedAtIndex(i:Int)
}

open class BNMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    open weak var delegate:BNMenuDelegate?
    open var arrayList:[String] = []
    open var arrayIcons:[String] = []
    open var iconSize:CGSize = CGSize(width: 45, height: 45)
    open var itemTextColor:UIColor = .black
    open var itemTextFont:UIFont = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)!
    
    var buttonClose: UIButton!
    var tableViewList: UITableView!
    var tableViewIcons: UITableView!
    var view1: UIView!
    var view2: UIView!
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view1 = UIView.init()
        view2 = UIView.init()
        tableViewIcons = UITableView.init()
        tableViewList = UITableView.init()
        buttonClose = UIButton.init()
        
        view1.frame = CGRect(x: 0, y: 0, width: 0, height: self.view.frame.size.height)
        view2.frame = CGRect(x: self.view.frame.size.width, y: 0, width: 0, height: self.view.frame.size.height)
        
        buttonClose.addTarget(self, action: #selector(buttonCloseClicked), for: .touchUpInside)
        buttonClose.backgroundColor = .black
        buttonClose.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        buttonClose.setTitle("X", for: .normal)
        buttonClose.layer.cornerRadius = 30
        buttonClose.alpha = 0.7
        
        tableViewIcons.backgroundColor = .clear
        tableViewIcons.separatorColor = .clear
        tableViewList.backgroundColor = .clear
        tableViewList.separatorColor = .clear
        
        tableViewIcons.delegate = self
        tableViewIcons.dataSource = self
        tableViewList.delegate = self
        tableViewList.dataSource = self
        
        tableViewIcons.frame = CGRect(x: 0, y: 80, width: view1.frame.size.width, height: view1.frame.size.height-200)
        tableViewList.frame = CGRect(x: 0, y: 80, width: view2.frame.size.width, height: view2.frame.size.height-200)
        
        self.tableViewList.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableViewIcons.register(UITableViewCell.self, forCellReuseIdentifier: "cellIcon")
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view1.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let blurEffect2 = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView2 = UIVisualEffectView(effect: blurEffect2)
        blurEffectView2.frame = view2.bounds
        blurEffectView2.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                
        self.view.addSubview(view1)
        view1.addSubview(blurEffectView)
        view1.addSubview(tableViewIcons)
        
        self.view.addSubview(view2)
        view2.addSubview(blurEffectView2)
        view2.addSubview(tableViewList)
        
        self.view.addSubview(buttonClose)
        
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        view1.frame = CGRect(x: 0, y: 0, width: 0, height: self.view.frame.size.height)
        view2.frame = CGRect(x: self.view.frame.size.width, y: 0, width: 0, height: self.view.frame.size.height)
        self.buttonClose.frame = CGRect(x: self.view.frame.size.width/4-30, y: self.view.frame.size.height, width: 60, height: 60)
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        self.buttonClose.frame = CGRect(x: self.view.frame.size.width/4-30, y: self.view.frame.size.height, width: 60, height: 60)
        
        UIView.animate(withDuration: 0.6, animations:{
            self.view1.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width/4, height: self.view.frame.size.height)
            self.view2.frame = CGRect(x: self.view.frame.size.width/4, y: 0, width: self.view.frame.size.width-self.view.frame.size.width/4, height: self.view.frame.size.height)
            self.buttonClose.frame = CGRect(x: self.view1.frame.size.width-30, y: self.view.frame.size.height-85, width: 60, height: 60)
            
            self.tableViewIcons.frame = CGRect(x: 0, y: 80, width: self.view1.frame.size.width, height: self.view1.frame.size.height-200)
            self.tableViewList.frame = CGRect(x: 0, y: 80, width: self.view2.frame.size.width, height: self.view2.frame.size.height-200)
        })
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @objc func buttonCloseClicked(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.view1.frame = CGRect(x: 0, y: 0, width: 0, height: self.view.frame.size.height)
            self.view2.frame = CGRect(x: self.view.frame.size.width, y: 0, width: 0, height: self.view.frame.size.height)
            self.buttonClose.alpha = 0
            
            self.tableViewIcons.frame = CGRect(x: 0, y: 80, width: self.view1.frame.size.width, height: self.view1.frame.size.height-200)
            self.tableViewList.frame = CGRect(x: 0, y: 80, width: self.view2.frame.size.width, height: self.view2.frame.size.height-200)
            
        }, completion:{ (finished: Bool) in
            self.dismiss(animated: false, completion: nil)
        })
    }
    
    //MARK: - UITableViewDataSource & UITableViewDelegate
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayList.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tableViewList {
            let cellIdentifier = "cell"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            cell.backgroundColor = .clear
            cell.textLabel?.text = arrayList[indexPath.row]
            cell.textLabel?.font = itemTextFont
            cell.textLabel?.textColor = itemTextColor
            cell.selectionStyle = .none
            return cell
        }else{
            let cellIdentifier = "cellIcon"
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            
            if let imageI = cell.viewWithTag(111) as? UIImageView {
                imageI.image = UIImage(named: arrayIcons[indexPath.row])
                imageI.frame = CGRect(x: cell.frame.size.width-iconSize.width-10, y: cell.frame.size.height/2-iconSize.height/2, width: iconSize.width, height: iconSize.height)
            }else {
                let imageI:UIImageView = UIImageView(image: UIImage(named: arrayIcons[indexPath.row]))
                imageI.tag = 111
                imageI.frame = CGRect(x: cell.frame.size.width-iconSize.width-10, y: cell.frame.size.height/2-iconSize.height/2, width: iconSize.width, height: iconSize.height)
                imageI.layer.shadowColor = UIColor.black.cgColor
                imageI.layer.shadowOffset = CGSize(width: 5, height: 5)
                cell.addSubview(imageI)
            }
            
            return cell
        }
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        buttonCloseClicked(self)
        delegate?.clickedAtIndex(i: indexPath.row)
    }
    
    //MARK: - UIScrollViewDelegate
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        tableViewIcons.contentOffset = scrollView.contentOffset
        tableViewList.contentOffset = scrollView.contentOffset
    }
    
    //MARK: - UIViewController Rotation
    override open func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation){
        UIView.animate(withDuration: 0.6, animations:{
            self.view1.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width/4, height: self.view.frame.size.height)
            self.view2.frame = CGRect(x: self.view.frame.size.width/4, y: 0, width: self.view.frame.size.width-self.view.frame.size.width/4, height: self.view.frame.size.height)
            self.buttonClose.frame = CGRect(x: self.view1.frame.size.width-30, y: self.view.frame.size.height-85, width: 60, height: 60)
            
            self.tableViewIcons.frame = CGRect(x: 0, y: 80, width: self.view1.frame.size.width, height: self.view1.frame.size.height-200)
            self.tableViewList.frame = CGRect(x: 0, y: 80, width: self.view2.frame.size.width, height: self.view2.frame.size.height-200)
            self.tableViewIcons.reloadData()
        }, completion:{ (finished: Bool) in
            //            self.tableViewIcons.reloadData()
        })
    }
    
    override open func didChangeValue(forKey key: String, withSetMutation mutationKind: NSKeyValueSetMutationKind, using objects: Set<AnyHashable>) {
        
    }
    
    
}

