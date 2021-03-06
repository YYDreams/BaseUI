//
//  BaseNavViewController.swift
//  XMHomeUI
//
//  Created by flowerflower on 2021/9/1.
//

class BaseNavViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        if NSObject.responds(to: #selector(getter: interactivePopGestureRecognizer)) {
            
            self.interactivePopGestureRecognizer?.delegate = self
        }
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if children.count > 0 {
            
            let btn = UIButton()
            
            btn.setImage(UIImage(named: "nav_left"), for: .normal)
            btn.addTarget(self, action: #selector(backClick), for: .touchUpInside)
            btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            btn.frame.size = CGSize(width: 40, height: 30)
            btn.contentMode = .topLeft
            btn.contentHorizontalAlignment = .left
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }
    
    @objc private func backClick(){
        
        
        popViewController(animated: true)
        
    }
}
extension BaseNavViewController:UIGestureRecognizerDelegate,UINavigationBarDelegate,UINavigationControllerDelegate{
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if self.navigationController?.viewControllers.count == 1 {
            
            return false
        }else {
            return true
        }
    }
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        if navigationController .responds(to: #selector(getter: interactivePopGestureRecognizer)) {
            navigationController.interactivePopGestureRecognizer?.isEnabled = true
        }
        
        if navigationController.viewControllers.count == 1 {
            navigationController.interactivePopGestureRecognizer?.isEnabled = false
            navigationController.interactivePopGestureRecognizer?.delegate = nil
            
        }
        
    }
    
    
}
