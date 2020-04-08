//
//  ViewController.swift
//  CVViewer
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import UIKit

class DisplayCVViewController: UITableViewController {
    var viewModel = DisplayCVViewModel(cvService: CVServiceImpl())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Config.appName
        navigationController?.navigationBar.prefersLargeTitles = true
        configure()
        viewModel.cvUpdated = { [weak self] in
            guard let self = self else { return }
            self.title = self.viewModel.applicantName ?? Config.appName
            self.tableView.reloadData()
        }
        viewModel.loadCv()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = viewModel.cellModel(at: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier, for: indexPath)
        if let configurableCell = cell as? ConfigurableTableViewCell {
            configurableCell.configure(model)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sectionModel(at: section).title
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    @objc func refresh(_ refreshControl: UIRefreshControl) {
        if viewModel.numberOfSections == 1, viewModel.numberOfRows(in: 0) == 1, viewModel.cellModel(at: IndexPath(row: 0, section: 0)) is LoadingCellModel {
            // is already loading, don't refresh
        } else {
            viewModel.loadCv()
        }
        refreshControl.endRefreshing()
    }
}

// MARK: TableViewController
extension DisplayCVViewController: TableViewController {
    func configure() {
        tableView.tableFooterView = UIView()
        //tableView.separatorStyle = .none
        
        // configure refresh
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        // configure cells
        tableView.register(UINib(nibName: "CVBasicCell", bundle: nil), forCellReuseIdentifier: CVBasicCellModel.identifier)
        tableView.register(UINib(nibName: "CVAddressCell", bundle: nil), forCellReuseIdentifier: CVAddressCellModel.identifier)
        tableView.register(UINib(nibName: "CVWorkCell", bundle: nil), forCellReuseIdentifier: CVWorkCellModel.identifier)
        tableView.register(UINib(nibName: "CVTitleSubtitleCell", bundle: nil), forCellReuseIdentifier: CVTitleSubtitleCellModel.identifier)
        tableView.register(UINib(nibName: "LoadingCell", bundle: nil), forCellReuseIdentifier: LoadingCellModel.identifier)
        tableView.register(UINib(nibName: "ErrorCell", bundle: nil), forCellReuseIdentifier: ErrorCellModel.identifier)
    }
}

