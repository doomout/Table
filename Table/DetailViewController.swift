
import UIKit

class DetailViewController: UIViewController {
    var receiveItem = "" //Main View에서 받을 텍스트를 위한 변수

    @IBOutlet var lblItem: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblItem.text = receiveItem //뷰가 노출될 때마다 이 내용을 레이블의 텍스트로 표시한다.
    }
    
    //Main View에서 변수를 받기 위한 함수를 추가
    func receiveItem(_ item: String){
        receiveItem = item
    }
}
