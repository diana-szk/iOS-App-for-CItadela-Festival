//
//  ArtistViewController.swift
//  CitadelaFestival
//
//  Created by Mayana on 6/3/20.
//  Copyright © 2020 Mayana. All rights reserved.
//

import UIKit

class ArtistViewController: UIViewController {
    
    var artistImage = ["Priku", "Praslea", "Mihigh", "Gescu", "Raresh", "Arapu", "Sepp", "Lizz"]
    var artistDescriptionLabel = ["Adrian Niculae, sau mai simplu si mai resonant, Priku, mixeaza din 2004, din 2007 figureaza ca membru Sunrise cu acte-n regula.Un tanar absolut talentat, manuieste-n permanenta un groove care nu te lasa sa stai jos, il remarci mereu la Sunwaves, se bucura de aprecierea clubberilor si e hotarat sa-si indrepte toata atentia catre productie.", "Praslea a venit pe lume in Sibiu pe 21 iunie 1986. A fost dintotdeauna pasionat de butoane si butonase. Rezultatul? A inceput sa mixeze techno acum vreo trei ani. Dupa doi ani s-a indragostit iremediabil de minimal si electro. A devenit unul dintre cei mai cunoscuti, formand o echipa minune, impreuna cu Raresh.", "Mihigh este DJ și producător, rezident al clubului Midi din Cluj încă din 2007. Face parte din familia Sunrise iar pasiunea sa pentru muzică se manifestă în seturi pline de vibe și atmosferă la unele dintre cele mai interesante evenimente din România, împărțind pupitrul cu tINI, Ricardo Villalobos, Arpiar, Zip, Marco Carola.", "Gescu este una dintre aparitiile relativ noi in decorul electronic local, inrolandu-se la Sunrise Booking la sfarsitul lui 2007. De atunci si pana acum, cam toate cluburile notabile din Bucuresti l-au avut ca invitat si a mixat cu toti colegii de 'familie', de la Kozo la El Cezere, la Praslea si Dan Andrei.", "Nascut in Bacau, Raresh a avut si are in continuare un mare impact asupra muzicii electronice. Si-a inceput cariera in Zebra, singurul club din Bacau in care se punea muzica electronica, iar dupa ce s-a cunoscut cu Sunrise Crew, a format casa de productie [a:rpia:r].", "Arapu este un nume din ce in ce mai cunoscut pe scena muzicii electronice a ultimilor ani, atat in Romania cat si pe plan international unde bifeaza evenimente importante de gen.Continua in Bucuresti unde intr-o perioada relativ scurta reuseste sa se impuna alaturi de nume importante ale muzicii electronice autohtone.", "Sepp aka Teo, nascut si crescut pe litoralul romanesc al Marii Negre, a avut primul contact cu muzica electronica in 2005, cand a ascultat pentru prima data diferiti artisti de la Cocoon Cocoon. DIn acel moment a devenit pasionat de sunetele techno. Dupa 3 ani a decis ca este timpul pentru productie.", "Lizz, pe numele sau real Petre Vali, originar din Buzau, momentan stabilit in Cluj-Napoca , a luat contact cu muzica electronica la varsta de 16 ani, si de atunci a dezvoltat o pasiune atat pentru productie cat si pentru mixat. Cunoscut pentru release-uri la label-uri, precum MOMENT Records, este intr-o ascensiune continua."]
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}

extension ArtistViewController: UITableViewDataSource {

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
    //determinam numarul de randuri din tabel
          return artistImage.count
      }
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //cream celula reutilizabila cu ajutorul identificatorului
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.cellIdentifier) as! ArtistTableViewCell
        
        //populam celula cu imaginile artistilor
          cell.artistImage.image = UIImage(named: "\(artistImage[indexPath.row])")
       
        //populam celula cu descrierea artistilor
          cell.artistDescriptionLabel.text! = artistDescriptionLabel[indexPath.row]
          return cell
      }
      
}

/*
extension ArtistViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
*/
