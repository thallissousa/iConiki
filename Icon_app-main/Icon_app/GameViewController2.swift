import UIKit



class GameViewController2: UIViewController {

    struct ImageProperties {
        let name: String
        let answer: String
    }
    
    let imgSet: [ImageProperties] = [
        ImageProperties(name: "tutorial", answer: ""),
        ImageProperties(name: "brev1", answer: "errado"),
        ImageProperties(name: "brev2", answer: "errado"),
        ImageProperties(name: "brev3", answer: "correto"),
        ImageProperties(name: "brev4", answer: "correto"),
        ImageProperties(name: "brev5", answer: "correto")
    ]

    @IBOutlet weak var imageShow: UIImageView!;
    

    
    var position = 0
    var score = 0
 
    
    @IBAction func correctButton(_ sender: UIButton) {
        
        if imgSet[position].answer == "correto"{
            score = score + 1
        }
        if position < imgSet.count - 1  {

            position = position + 1
            imageShow.image = UIImage(named: imgSet[position].name)
            imageShow.adjustsImageSizeForAccessibilityContentSizeCategory = true
            imageShow.contentMode = .scaleAspectFit


            // este else envia o score à tela de pontuação quando não há mais imagens no set.
        }else{
            position = 0
            performSegue(withIdentifier: "score", sender: nil)
        }
        

        
    }
    
    @IBAction func wrongButton(_ sender: UIButton) {
        
        if imgSet[position].answer == "errado"{
            score = score + 1
        }
        if position < imgSet.count - 1 {

            position = position + 1
            imageShow.image = UIImage(named: imgSet[position].name)
            imageShow.adjustsImageSizeForAccessibilityContentSizeCategory = true
            imageShow.contentMode = .scaleAspectFit

            
            // este else envia o score à tela de pontuação quando não há mais imagens no set.
        }else{

            position = 0
            performSegue(withIdentifier: "score", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageShow.image = UIImage(named: imgSet[position].name)
        imageShow.contentMode = .scaleAspectFit
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let VCDestino: ScoreViewController = segue.destination as! ScoreViewController
        VCDestino.pontos = score
    }



}
