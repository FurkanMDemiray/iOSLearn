import UIKit

class AdsCell: UICollectionViewCell {

    let reklamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(reklamImageView)
        NSLayoutConstraint.activate([
            reklamImageView.topAnchor.constraint(equalTo: topAnchor),
            reklamImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            reklamImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            reklamImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }

    func configure(with image: UIImage) {
        reklamImageView.image = image
    }
}


