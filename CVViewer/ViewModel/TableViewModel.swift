//
//  TableViewModel.swift
//  CVViewer
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewModel {
    var sections: [TableViewSectionModel] { get }
}

extension TableViewModel {
    var numberOfSections: Int {
        return sections.count
    }
    
    func numberOfRows(in section: Int) -> Int {
        return sections[section].cells.count
    }
    
    func cellModel(at indexPath: IndexPath) -> TableViewCellModel {
        return sections[indexPath.section].cells[indexPath.row]
    }
    
    func sectionModel(at index: Int) -> TableViewSectionModel {
        return sections[index]
    }
}

protocol TableViewController: UITableViewController {
    func configure()
}

protocol TableViewSectionModel {
    var title: String? { get }
    var cells: [TableViewCellModel] { get }
}

struct TableSectionModel: TableViewSectionModel {
    var title: String?
    var cells: [TableViewCellModel] = []
    
    init(title: String?, cells: [TableViewCellModel]) {
        self.title = title
        self.cells = cells
    }
    
    init(cells: [TableViewCellModel]) {
        self.cells = cells
    }
}
