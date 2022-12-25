
import UIKit

var items = ["책 구매", "영어 회화 공부", "영상 편집"]
var itemsImageFile = ["cart.png", "clock.png", "pencil.png"]

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //edit 버튼 눌렀을 때 왼쪽에 삭제 버튼 표시
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    //테이블 안의 섹션 개수를 1로 설정함
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    //섹션당 열의 개수를 전달
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    //테이블 목록 부분
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        //셀의 텍스트 레이블에 앞에서 선언한 items을 대입한다.
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        //셀의 이미지 뷰에 앞에 선언한 itemsImageFile을 대입한다.
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // 테이블 목록에서 삭제 함수
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    //delete 를 한글로 수정
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }

    
    //목록 순서 바꾸는 함수
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let itemToMove = items[(fromIndexPath as NSIndexPath).row] //이동할 아이템의 위치를 저장
        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row] //이동할 아이템의 이미지를 저장
        items.remove(at: (fromIndexPath as NSIndexPath).row) //이동할 아이템을 삭제, 삭제한 아이템 뒤의 아이템의 인덱스가 재정렬됨
        items.insert(itemToMove, at: (to as NSIndexPath).row) //삭제된 아이템을 이동할 위치로 삽입. 삽입한 아이템 뒤의 인덱스가 재정렬
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row) //삭제된 아이템의 이미지를 이동할 위치로 삽입
    }
    
    //테이블 뷰로 다시 불러온다.
    override func viewWillAppear(_ animated: Bool){
        tvListView.reloadData()
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItem(items[((indexPath! as NSIndexPath).row)])
        }
    }
    

}
