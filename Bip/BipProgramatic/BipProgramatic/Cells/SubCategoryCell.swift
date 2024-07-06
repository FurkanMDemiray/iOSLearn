import UIKit

class SubCategoryCell: UICollectionViewCell {

    let label: UILabel = {
        let label = UILabel()
        label.text = "PUBG"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "PUBG BiP Kanalı"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        imageView.image = UIImage(named: "pubg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Takip Et", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private func configureButton() {
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: infoStackView.trailingAnchor, constant: 8),
            button.widthAnchor.constraint(equalToConstant: 100)
            ])
    }

    lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [label, infoLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, infoStackView, button])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private func configureStackView() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        configureStackView()
        configureButton()
    }

}


