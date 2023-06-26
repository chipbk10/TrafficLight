//
//  ViewController.swift
//  TrafficLight
//
//  Created by Hieu Luong on 21/06/2023.
//

import UIKit

final class CarViewController: UIViewController {

    
    // MARK: - Private UI Properties
    
    private lazy var containerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        view.addSubview(stackView)

        // layout
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        return stackView
    }()
    
    private lazy var containerTextView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        containerView.addArrangedSubview(stackView)
        return stackView
    }()
    
    lazy var warningLabelView: UILabel = {
        let label = UILabel()
        label.textColor = .red
        containerView.addArrangedSubview(label)
        return label
    }()
    
    private lazy var labelView: UILabel = {
        let label = UILabel()
        label.textColor = .black
        containerTextView.addArrangedSubview(label)
        return label
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.textContainer.maximumNumberOfLines = 1
        textView.autocorrectionType = .no
        textView.backgroundColor = .secondarySystemBackground
        textView.textColor = .blue
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.widthAnchor.constraint(equalToConstant: 150)
        ])
        containerTextView.addArrangedSubview(textView)
        return textView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 200)
        ])
        containerView.addArrangedSubview(button)
        return button
    }()
    
    // MARK: - Properties
    
    let viewModel: CarViewModel
    let completion: (String) -> Void
    
    // MARK: - Inits
    
    init(viewModel: CarViewModel, completion: @escaping (String) -> Void) {
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
        view.backgroundColor = .white
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        warningLabelView.text = viewModel.invalidCarModelMessage
        labelView.text = "Car Model: "
        textView.delegate = self
        button.setTitle("Start Driving", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
}
