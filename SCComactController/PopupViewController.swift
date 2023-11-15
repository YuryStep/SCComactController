//
//  PopupViewController.swift
//  SCComactController
//
//  Created by Юрий Степанчук on 15.11.2023.
//

import UIKit

final class PopupViewController: UIViewController {
    private lazy var closeButton = {
        let closeButton = UIButton(type: .close)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector (closeButtonTapped), for: .touchUpInside)
        return closeButton
    }()

    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["280", "150"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(setSelfSize), for: .allEvents)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setSelfSize()
        setupView()
    }

    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(closeButton)
        view.addSubview(segmentedControl)

        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            closeButton.centerYAnchor.constraint(equalTo: segmentedControl.centerYAnchor, constant: 0),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    @objc private func setSelfSize() {
        self.preferredContentSize = CGSize(width: 300, height: segmentedControl.selectedSegmentIndex == 0 ? 280 : 150)
    }

    @objc private func closeButtonTapped() {
        self.dismiss(animated: true)
    }
}
