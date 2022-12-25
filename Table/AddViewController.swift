import UIKit
import UIKit

class AddViewController: UIViewController {

    @IBOutlet var tfAddItem: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!) //items에 텍스트 필드의 텍스트 값을 추가한다.
        itemsImageFile.append("clock.png") //이미지는 시계 이미지
        tfAddItem.text="" //텍스트 필드의 내용을 지운다.
        _ = navigationController?.popViewController(animated: true) //테이블 뷰로 돌아간다.
    }
    
}
