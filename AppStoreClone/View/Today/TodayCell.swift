import UIKit


class TodayCell: UICollectionViewCell {


    let catogoryLabel: UILabel = .textLabel(text: "VIAGEM", fontSize: 18)
    let titleLabel: UILabel = .textBoldLabel(text: "Explore o mundo \nsem medo", fontSize: 28, numberOfLine: 2)

    let imageView: UIImageView = .todayImageView(named: "destaque-1")
    let descriptionLabel: UILabel = .textLabel(text: "Podemos viajar o mundo em busca da beleza, mas nunca a encontraremos se não a carregarmos dentro de nos", fontSize: 14, numberOfLine: 3)



    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true

        // use box para limitar o tamanho da imagem
        let boxView = UIView()
        boxView.clipsToBounds = true
        boxView.addSubview(imageView)

        // centraliza a imagem dentro da boxView
        imageView.centerXAnchor.constraint(equalTo: boxView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: boxView.centerYAnchor).isActive = true

        // seta o tamanho da imagem
        imageView.size(size: .init(width: bounds.width, height: 250))

        let stackView = UIStackView(arrangedSubviews: [catogoryLabel, titleLabel, boxView, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 8

        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

}

extension TodayVC {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // pega a celula clicada
        if let cell = collectionView.cellForItem(at: indexPath) {
            // pega a posicao da celula(frame)
            if let frame = cell.superview?.convert(cell.frame, to: nil){
               let modalView = UIView()
                modalView.frame = frame
                modalView.backgroundColor = .red

                view.addSubview(modalView)
            }
        }
    }
}
