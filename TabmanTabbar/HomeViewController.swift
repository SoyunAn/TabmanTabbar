//
//  ViewController.swift
//  TabmanTabbar
//
//  Created by 안소윤 on 2022/03/15.
//

import UIKit
import Tabman
import Pageboy

class HomeViewController: TabmanViewController {
    
    private var viewControllers: Array<UIViewController> = []
    

    @IBOutlet weak var tmepView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let homeHomeVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeHomeVC") as! HomeHomeViewController
                let brandVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BrandVC") as! BrandViewController
                let bestVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BestVC") as! BestViewController
                let saleVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SaleVC") as! SaleViewController
                    
                viewControllers.append(homeHomeVC)
                viewControllers.append(brandVC)
                viewControllers.append(bestVC)
                viewControllers.append(saleVC)
                
                self.dataSource = self

                // Create bar
                let bar = TMBar.ButtonBar()
        //        let bar = TMBar.TabBar()
                bar.backgroundView.style = .blur(style: .regular)
                bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
                bar.buttons.customize { (button) in
                    button.tintColor = UIColor.lightGray // 선택 안되어 있을 때
                    button.selectedTintColor = .black // 선택 되어 있을 때
                }
                // 인디케이터 조정
                bar.indicator.weight = .light
                bar.indicator.tintColor = .black
                bar.indicator.overscrollBehavior = .compress
                bar.layout.alignment = .centerDistributed
                bar.layout.contentMode = .fit
                bar.layout.interButtonSpacing = 35 // 버튼 사이 간격
            
                bar.layout.transitionStyle = .snap // Customize

                // Add to view
                addBar(bar, dataSource: self, at: .custom(view: tmepView, layout: nil)) // .custom을 통해 원하는 뷰에 삽입함. BarLocation -
    }

    

}

extension HomeViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
//        let item = TMBarItem(title: "")
//        item.title = "Page \(index)"
//        item.image = UIImage(named: "image.png")
//
//        return item
        
        // MARK: - Tab 안 글씨들
        switch index {
        case 0:
            return TMBarItem(title: "홈")
        case 1:
            return TMBarItem(title: "Brand")
        case 2:
            return TMBarItem(title: "베스트")
        case 3:
            return TMBarItem(title: "세일")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }

    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    
}

extension UIColor {
    static let mainGray = UIColor(named: "mainGray")
}
