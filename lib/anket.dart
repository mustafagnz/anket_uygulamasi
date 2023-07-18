import 'package:flutter/material.dart';
import 'package:polls/polls.dart';

class anket extends StatefulWidget {
  const anket({super.key});

  @override
  State<anket> createState() => _anketState();
}

class _anketState extends State<anket> {

  double secenek1 = 1;
  double secenek2 = 1;
  double secenek3 = 1;
  double secenek4 = 1;

  Map oykullananlar ={
    'a@gmail.com' : 1,
    'b@gmail.com' : 3,
    'v@gmail.com' : 2,
    'c@gmail.com' : 1,

  };

  String kullanici = "aktif olan kisi";
  String admin = "yonetici";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anket"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        // tüm kenarlardan boşluk bıraktık
        padding: const EdgeInsets.all(9.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Polls(
            children: [
              Polls.options(title: 'i stanbul', value: secenek1),
              Polls.options(title: 'ankara', value: secenek2),
              Polls.options(title: 'izmir', value: secenek3),
              Polls.options(title: 'diger', value: secenek4),
          ],
              //soru
              question: Text("hangi sehirde ikamet etmek istersiniz?"),

              //oylama verisi map tipinde json verisi
              voteData: oykullananlar,

              //sisteme giren kişi bilgisi
              currentUser: this.kullanici,

              //admin anketi olusturan kisi
              creatorID: this.admin,

              // üstüste oy kullanımını engellemek ve oy kullananlar içerisinde arama yapmak
              userChoice: oykullananlar[this.kullanici],

              onVoteBackgroundColor: Colors.cyan,
              leadingBackgroundColor: Colors.cyan,
              backgroundColor: Colors.white,
              onVote: (secim){

                print(secim);
                setState(() {
                  this.oykullananlar[this.kullanici] = secim;
                });

                if(secim == 1){
                  setState(() {
                    secenek1 += 1;
                  });
                }
                else if(secim == 2){
                  setState(() {
                    secenek2 += 1;
                  });
                }
                else if(secim == 3){
                  setState(() {
                    secenek3 += 1;
                  });
                }
                else if(secim == 4){
                  setState(() {
                    secenek4 += 1;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
