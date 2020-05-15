//Created  on 2019/3/12 by  LCD:https://github.com/liucaide .

/***** 模块文档 *****
 *
 */



import Foundation
import UIKit
import CaamDauEmpty

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var emptyView: CD_EmptyView = {
        let v = CD_EmptyView()
        v.items = itemsLoad
        return v
    }()
    lazy var itemsLoad: [CD_EmptyView.Item] = {
        return [
            .activity(nil),
            .image({
                
                let list:[UIImage] = [
                    UIImage(named: "logo")!
                ]
                $0.animationImages = list
                $0.animationDuration = 1
                $0.animationRepeatCount = 0
                $0.startAnimating()
            }, {[unowned self] in
                self.emptyView.items = self.itemsNotData
            }),
            .button({
                $0.cd.text("正在拼命加载中")
            }, {[unowned self] in
                self.emptyView.items = self.itemsNotData
            })
        ]
    }()
    
    lazy var itemsNotData: [CD_EmptyView.Item] = {
        return [
            .button({
                
                $0.cd.text("XX")
            }, {[unowned self] in
                self.emptyView.items = self.itemsLoad
            }),
            .button({
                $0.cd.text("没有数据")
            }, {[unowned self] in
                self.emptyView.items = self.itemsLoad
            })
        ]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.backgroundView = emptyView
    }
}



