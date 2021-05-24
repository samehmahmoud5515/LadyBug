//
//  MyFarmDetailsServiceTableView.swift
//  LadyBug
//
//  Created by SAMEH on 06/03/2021.
//

import UIKit

class MyFarmDetailsServiceTableView: UIView {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var serviceTableCollectionView: UICollectionView!
    @IBOutlet weak var tasksTableView: DynamicHeightTableView!
    @IBOutlet weak var addTaskTitleLabel: UILabel!
    @IBOutlet weak var addTaskButton: UIButton!
    
    var datasource = [ServiceTable]() {
        didSet {
            serviceTableCollectionView.reloadData()
            tasksTableView.reloadData()
        }
    }
    
    var selectedServiceTableIndex = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nibSetup()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        nibSetup()
    }
        
    private func nibSetup() {
        Bundle.main.loadNibNamed("\(MyFarmDetailsServiceTableView.self)",
                                 owner: self, options: nil)
        guard let contentView = contentView else { return }
        contentView.frame = bounds
        addSubview(contentView)
        setupUI()
        observeOnCollectionViewContentSize()
    }
    
    private func observeOnCollectionViewContentSize() {
        tasksTableView.addObserver(self, forKeyPath: "contentSize", options: [.new, .old, .initial, .prior], context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                                   of object: Any?,
                                   change: [NSKeyValueChangeKey : Any]?,
                                   context: UnsafeMutableRawPointer?) {
        self.layoutSubviews()
    }
    
}

extension MyFarmDetailsServiceTableView {
    private func setupUI() {
        setupLabelFonts()
        setupLabelColors()
        registerCollectionViewCell()
        setupCollectionViewLayout()
        registerTableViewCell()
        setupTableViewRowHeight()
    }
    
    private func setupLabelFonts() {
        addTaskTitleLabel.font = UIFont.get(enFont: .bold(12), arFont: .bold(12))
        addTaskButton.titleLabel?.font = UIFont.get(enFont: .regular(10), arFont: .regular(10))
    }
    
    private func setupLabelColors() {
        addTaskTitleLabel.textColor = .purplishBrownTwo
    }
    
    private func registerCollectionViewCell() {
        let nib = UINib(nibName: "\(MyFarmServiceTableCell.self)", bundle: nil)
        serviceTableCollectionView.register(nib, forCellWithReuseIdentifier: "\(MyFarmServiceTableCell.self)")
    }
    
    private func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 4, height: serviceTableCollectionView.bounds.height)
        layout.scrollDirection = .horizontal
        serviceTableCollectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    private func registerTableViewCell() {
        let nib = UINib(nibName: "\(MyFarmDetailsTaskCell.self)", bundle: nil)
        tasksTableView.register(nib, forCellReuseIdentifier: "\(MyFarmDetailsTaskCell.self)")
    }
    
    private func setupTableViewRowHeight() {
        tasksTableView.rowHeight = 74
    }
    
}

extension MyFarmDetailsServiceTableView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MyFarmServiceTableCell.self)", for: indexPath) as? MyFarmServiceTableCell ?? MyFarmServiceTableCell()
        cell.setupUI(isSelected: datasource[indexPath.row].isSelected)
        return cell
    }
    
}

extension MyFarmDetailsServiceTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource[selectedServiceTableIndex].tasks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(MyFarmDetailsTaskCell.self)", for: indexPath) as? MyFarmDetailsTaskCell ?? MyFarmDetailsTaskCell()
        let item = datasource[selectedServiceTableIndex].tasks?[indexPath.row]
        let isDone = item?.done ?? false
        cell.setupUI(isSelected: isDone)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard var item = datasource[selectedServiceTableIndex].tasks?[indexPath.row] else { return }
        let selection = !(item.done)
        item.done = selection
        if let cell = tableView.cellForRow(at: indexPath) as? MyFarmDetailsTaskCell {
            cell.setupUI(isSelected: selection)
        }
    }
}

extension MyFarmDetailsServiceTableView {
    @IBAction func addTaskDidTapped(_ sender: Any) {
        let vc = AddTaskViewController()
        vc.modalPresentationStyle = .overCurrentContext
        self.parentViewController?.present(vc, animated: false, completion: nil)
    }
}
