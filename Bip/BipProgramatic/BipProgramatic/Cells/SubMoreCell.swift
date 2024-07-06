import UIKit

class SubMoreCell: UITableViewCell {

    let screenHeight = UIScreen.main.bounds.height

    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private func configureLabel() {
        label.font = screenHeight < 750 ? UIFont.boldSystemFont(ofSize: 16) : UIFont.boldSystemFont(ofSize: 18)
    }

    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.image = UIImage(systemName: "gear")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [image, label])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private func configureInfoStackView() {
        contentView.addSubview(infoStackView)
        NSLayoutConstraint.activate([
            infoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            infoStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            infoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        configureInfoStackView()
        configureLabel()
    }

    func configure(with text: String) {
        label.text = text
    }

}


