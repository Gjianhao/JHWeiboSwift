//
//  FBMeViewController.swift
//  SwiftDemo
//
//  Created by gjh on 14/12/2020.
//

import UIKit

class FBMeViewController: FBMeBaseViewController {
    
    // 定义类型别名
    typealias RowModel = [String: String]
    
    // private只允许在当前类所在源文件中调用， 修饰的方法不可以被代码域之外的地方访问 ，本类源码文件的extension除外。
    private let tableView: UITableView = {
        let view =  UITableView(frame: .zero, style: .grouped)
        view.register(FBMeBaseCell.self, forCellReuseIdentifier: FBMeBaseCell.ID)
        return view
    }()
    
    // fileprivate 其修饰的属性或者方法只能在当前的 Swift 源文件里可以访问，即在同一个文件中，所有的 fileprivate 方法属性都是可以访问到的。
    // open > public > interal > fileprivate > private
    fileprivate var user: FBMeUser {
        get {
            return FBMeUser(name: "BayMax", avatarName: "", education: "CMU")
        }
    }
    fileprivate var tableViewDataSource: [[String: Any]] {
        get {
            TableKeys.populate(withUser: user)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "FaceBook"
        navigationController?.navigationBar.barTintColor = Specs.color.tint
        
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        func binarySearch(nums: [Int], target: Int) -> Int {
            var left = 0
            var right = nums.count - 1
            
            while left <= right {
                let middle = (left + right) / 2
                if nums[middle] == target {
                    return middle
                } else if nums[middle] > target {
                    right = middle - 1
                } else if nums[middle] < target {
                    left = middle + 1
                }
            }
            return -1
        }

        let result = binarySearch(nums: [1, 2, 4, 8, 16, 32, 64, 128], target: 3)
        print(result)
    }
    
    
    
    // MARK: -获取每行的内容
    fileprivate func rows(at section: Int) -> [Any] {
        return tableViewDataSource[section][TableKeys.Rows] as! [Any]
    }
    fileprivate func title(at section: Int) -> String? {
        return tableViewDataSource[section][TableKeys.Section] as? String
    }
    fileprivate func rowModel(at indexPath: IndexPath) -> RowModel {
        return rows(at: indexPath.section)[indexPath.row] as! RowModel
    }
}

extension FBMeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewDataSource.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows(at: section).count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return title(at: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // get RewModel
        let modelForRow = rowModel(at: indexPath)
        
        var cell = UITableViewCell()
        
        // title 有值就继续往下走，否则就返回
        guard let title = modelForRow[TableKeys.Title] else { return cell }
        if title == user.name {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: nil)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: FBMeBaseCell.ID, for: indexPath)
        }
        
        cell.textLabel?.text = title
        
        if let imageName = modelForRow[TableKeys.ImageName] {
            cell.imageView?.image = UIImage(named: imageName)
        } else if title != TableKeys.logout {
            cell.imageView?.image = UIImage(named: Specs.imageName.placeholder)
        }
        
        if title == user.name {
            cell.detailTextLabel?.text = modelForRow[TableKeys.SubTitle]
        }
        return cell
    }
}

extension FBMeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
