//
//  TrafficLightViewController.swift
//  TrafficLight
//
//  Created by Hieu Luong on 21/06/2023.
//

import UIKit

final class TrafficLightViewController: UIViewController {
    
    // MARK: - Private UI Properties
    
    private lazy var containerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 20
        view.addSubview(stackView)

        // layout
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        return stackView
    }()
    
    private lazy var labelView: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        containerView.addArrangedSubview(label)
        return label
    }()
    
    lazy var secondLabelView: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        containerView.addArrangedSubview(label)
        return label
    }()
    
    private func setupLightView(property: LightProperty) -> CircleView {
                                
        let view = CircleView(property: property)
        view.set(active: false, animation: false)
        containerView.addArrangedSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalTo: view.heightAnchor),
            view.widthAnchor.constraint(equalToConstant: 50)
        ])
        return view
    }
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 200)
        ])
        containerView.addArrangedSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Properties
    
    let viewModel: TrafficLightViewModel
    let completion: () -> Void
    var lightViews: [CircleView] = []
    
    // MARK: - Inits
    
    init(viewModel: TrafficLightViewModel, completion: @escaping () -> Void) {
        self.viewModel = viewModel
        self.completion = completion
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }        
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addObservers()                
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeObservers()
        super.viewWillDisappear(animated)
    }
    
    // MARK: - Private Methods
        
    private func setupUI() {
        view.backgroundColor = .white
        setupBackButton()
        labelView.text = viewModel.carModel
        lightViews = viewModel.lightProperties.map(setupLightView(property:))
        button.setTitle("Start", for: .normal)
        secondLabelView.text = "0"
    }
    
    private func setupBackButton() {
        let backButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(tapOnBack))
        navigationItem.leftBarButtonItem = backButton
    }
}

// MARK: - Events

extension TrafficLightViewController {
    
    @objc func tapOnBack() {
        completion()
    }
    
    @objc func didTapButton() {
        switch button.currentTitle {
        case "Start":
            button.setTitle("Stop", for: .normal)
            start()            
        case "Stop":
            button.setTitle("Start", for: .normal)
            stop()            
        default:
            break
        }
    }
}
