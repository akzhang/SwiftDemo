//
//  HomeTableViewController.swift
//  SwiftDemo
//
//  Created by chengruipeng on 2017/7/3.
//  Copyright © 2017年 矽岸. All rights reserved.
//
import UIKit
import SnapKit

class HomeTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView?
    let identifier = "cell"
    var titltArray = ["Moya + MVVN + RxSwift + ObjectMapper", "PNChart-Swift", "LoginDemo"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        setUpTable()
    }

    func setUpTable() {
        tableView = UITableView()
        self.view.addSubview(tableView!)
        tableView!.backgroundColor = UIColor.white
        tableView!.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
        tableView!.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        tableView!.delegate = self
        tableView!.dataSource = self
        tableView?.tableFooterView = UIView()

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HomeTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifier)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.firstTitle?.text = titltArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titltArray.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let moya = RankViewController()
            self.navigationController?.pushViewController(moya, animated: true)
        case 1:
            let pnCharViewController = PNChartViewController()
            self.navigationController?.pushViewController(pnCharViewController, animated: true)
        default:
            let loginViewController = LoginViewController()
            self.navigationController?.pushViewController(loginViewController, animated: true)
        }
    }
}
