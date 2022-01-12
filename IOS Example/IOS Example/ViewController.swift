//
//  ViewController.swift
//  IOS Example
//
//  Created by isEmpty on 12.01.2022.
//

import UIKit
import ConstraintLayoutBuilder
import KeyPathLayoutBuilder

class ViewController: UIViewController {
    
    let orangeView = UIView().apply {
        $0.backgroundColor = .orange
    }
    let cyanView = UIView().apply {
        $0.backgroundColor = .cyan
    }
    let systemGrayView = UIView().apply {
        $0.backgroundColor = .systemGray3
    }

    let redView = UIView().apply {
        $0.backgroundColor = .red
    }
    let blueView = UIView().apply {
        $0.backgroundColor = .blue
    }
    let darkGrayView = UIView().apply {
        $0.backgroundColor = .darkGray
    }
    
    let greenView = UIView().apply {
        $0.backgroundColor = .green
    }
    let yellowView = UIView().apply {
        $0.backgroundColor = .yellow
    }
    let lightGrayView = UIView().apply {
        $0.backgroundColor = .lightGray
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Old Style
        view.addSubview(orangeView)
        orangeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            orangeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            orangeView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            orangeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            orangeView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
        
        view.addSubview(cyanView)
        cyanView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cyanView.topAnchor.constraint(equalTo: orangeView.topAnchor),
            cyanView.heightAnchor.constraint(equalTo: orangeView.heightAnchor),
            cyanView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cyanView.widthAnchor.constraint(equalTo: orangeView.widthAnchor)
        ])

        view.addSubview(systemGrayView)
        systemGrayView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            systemGrayView.topAnchor.constraint(equalTo: orangeView.bottomAnchor),
            systemGrayView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            systemGrayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            systemGrayView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        
        // MARK: Constraint Layout
        view.addSubview(redView) { container, view in
            view.topAnchor.constraint(equalTo: systemGrayView.bottomAnchor)
            view.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.1)
            view.leadingAnchor.constraint(equalTo: container.leadingAnchor)
            view.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.5)
        }
        
        view.addSubview(blueView) { container, view in
            view.topAnchor.constraint(equalTo: redView.topAnchor)
            view.heightAnchor.constraint(equalTo: redView.heightAnchor)
            view.trailingAnchor.constraint(equalTo: container.trailingAnchor)
            view.widthAnchor.constraint(equalTo: redView.widthAnchor)
        }
        
        view.addSubview(darkGrayView) { container, view in
            view.topAnchor.constraint(equalTo: redView.bottomAnchor)
            view.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.1)
            view.leadingAnchor.constraint(equalTo: container.leadingAnchor)
            view.trailingAnchor.constraint(equalTo: container.trailingAnchor)
        }
        
        // MARK: KeyPath Layout
        view.addSubview(greenView) {
            $0.equal(\.topAnchor, to: darkGrayView, \.bottomAnchor)
            $0.equal(\.heightAnchor, multiplier: 0.1)
            $0.equal(\.leadingAnchor)
            $0.equal(\.widthAnchor, multiplier: 0.5)
        }
        
        view.addSubview(yellowView) {
            $0.equal(\.topAnchor, to: greenView)
            $0.equal(\.heightAnchor, to: greenView)
            $0.equal(\.trailingAnchor)
            $0.equal(\.widthAnchor, to: greenView)
        }

        view.addSubview(lightGrayView) {
            $0.equal(\.leadingAnchor)
            $0.equal(\.trailingAnchor)
            $0.equal(\.topAnchor, to: yellowView, \.bottomAnchor)
            $0.equal(\.heightAnchor, multiplier: 0.1)
        }
    }
}
