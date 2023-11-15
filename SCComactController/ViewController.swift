//
//  ViewController.swift
//  SCComactController
//
//  Created by Юрий Степанчук on 15.11.2023.
//

import UIKit

class ViewController: UIViewController {

    private lazy var presentButton = {
        let presentButton = UIButton(configuration: .plain())
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        presentButton.setTitle("Present", for: .normal)
        presentButton.addTarget(self, action: #selector (presentButtonTapped), for: .touchUpInside)
        return presentButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.addSubview(presentButton)
        NSLayoutConstraint.activate([
            presentButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc func presentButtonTapped() {
        let popupViewController = PopupViewController()
        popupViewController.modalPresentationStyle = .popover
        popupViewController.popoverPresentationController?.sourceView = presentButton
        popupViewController.popoverPresentationController?.permittedArrowDirections = .up
        popupViewController.popoverPresentationController?.delegate = self
        self.present(popupViewController, animated: true, completion: nil)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate { 
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        .none
    }
}
