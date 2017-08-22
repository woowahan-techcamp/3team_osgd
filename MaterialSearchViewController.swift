//
//  MaterialSearchViewController.swift
//  fling
//
//  Created by woowabrothers on 2017. 8. 22..
//  Copyright © 2017년 osgd. All rights reserved.
//

import UIKit

class MaterialSearchViewController: UIViewController, UISearchBarDelegate {

    let searchMaterial = Notification.Name.init("searchMaterial")
    var searchList = SearchList.init()
    let network = Network.init()

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(drawSearchList),
                                               name: searchMaterial, object: nil)
    }

    func drawSearchList(noti: Notification) {
        if let data = noti.userInfo?["data"] as? SearchList {
            self.searchList = data
            self.searchTable.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.characters.count != 0 {
            self.network.searchMaterialsWith(keyword: searchText)
        }
    }
}

extension MaterialSearchViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchList.result.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //swiftlint:disable line_length
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "materialCell", for: indexPath) as? MaterialSearchTableViewCell
        else {
            return MaterialSearchTableViewCell()
        }
        cell.materialLabel.text = self.searchList.result[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
