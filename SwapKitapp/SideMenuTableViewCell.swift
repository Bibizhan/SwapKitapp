
import UIKit
import Cartography
class SideMenuTableViewCell: UITableViewCell {
    //MARK: - Properties
    let displayHeight = UIScreen.main.bounds.height
    let displayWidth = UIScreen.main.bounds.width
    
    //MARK: - Ui init
    lazy var icons: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        image.layer.cornerRadius = 5
        return image
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    //MARK: - Init
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "cell")
        configureViews()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup views
    func configureViews(){
        [icons,title].forEach { (view) in
            contentView.addSubview(view)
        }
    }
    
    func configureConstraints(){
        constrain(icons, self) { i, s in
            i.top == s.top + (15 / 736 * displayHeight)
            i.left == s.left + 15
            i.width == 20 / 414 * displayWidth
            i.height == 20 / 736 * displayHeight
            
        }
        constrain( title, icons, self){  t, i, s in
            // t.centerY == s.centerY
        }
        constrain(title, icons, self){ t, i, s in
            t.top == s.top + (15 / 736 * displayHeight)
            t.left == i.right + 15
            t.right == s.right - 15
        }
        
    }
    
}
