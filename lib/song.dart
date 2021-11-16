import 'package:flutter/material.dart';
import 'main.dart';
import 'mymusic.dart';

void main() {
  runApp(const MyApp());
}
class MyMusic extends StatefulWidget {
  const MyMusic({Key? key}) : super(key: key);

  @override
  _MyMusicState createState() => _MyMusicState();
}
class SongInfo {
  String title;
  String singer;
  String image;
  String path;
  SongInfo( {required this.title, required this.singer, required this.image, required this.path});


}

class _MyMusicState extends State<MyMusic> {
  late List song;
  void initState() {
    song = getList();
    super.initState();
}

  List getList(){
    return[
      SongInfo(title: 'Good Days',singer: 'SZA' ,image:"assets/gooddays.jpg" ,
          path: "assets/Good_Days.mp3"),
      SongInfo(title: 'Forever',singer: 'Labrinth',image:"assets/euphoria.jpeg",
          path: "assets/Forever.mp3"),
      SongInfo(title: 'Formula',singer: 'Labrinth',image: "assets/euphoria.jpeg",
          path: "assets/Formula.mp3"),
      SongInfo(title: 'Go with u Remix',singer: 'Baynk',image: "assets/gowithu.jpg",
          path: "assets/go_with_u.mp3"),
      SongInfo(title: 'Eastside',singer:'Benny Blanco ft. Halsey,khalid',image: "assets/eastside.jpg",
          path:"assets/Eastside.mp3"),
      SongInfo(title: 'Mystery Of Love',singer:'Sufjan Stevens',image: "assets/mystery.jpg",
          path:"assets/Mystery_of_Love.mp3"),
      SongInfo(title: 'free love',singer: 'Honne',image: "freelove.jpg",
          path:"assets/free_love.mp3"),
      SongInfo(title: 'Wander',singer: 'Keegan Dewitt' ,image:"wander.jpg",
          path:"assets/wander.mp3"),


    ];
  }
  Widget customListView({
    required String title,
    required String singer,
    required String image,
    required String path,
    onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Stack(children: [
              Container(
                height: 80.0,
                width: 80.0,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child:Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                ),
              ),
              Container(
                height: 80.0,
                width: 80.0,
                child: Icon(
                  Icons.play_circle_filled,
                  color: Colors.white.withOpacity(0.7),
                  size: 42.0,
                ),
              )
            ]),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white60,
                      fontWeight: FontWeight.normal,
                      fontSize: 20.0
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  singer,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 14.0),
                ),
              ],
            ),
            const Spacer(),//maintain space b/w widgets in row/column
            Icon(
              Icons.more_horiz,
              color: Colors.white.withOpacity(0.6),
              size: 32.0,
            ),

            Icon(
              Icons.favorite,
              color: Colors.white.withOpacity(0.6),
              size: 12.0,

            ),

          ],
        ),
      ),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          "Playlist",
          style: TextStyle(
              color: Colors.white70,
              fontStyle: FontStyle.italic,
              fontSize: 25.0),
        ),
      ),
      body:
      Column(children: [

        Expanded(
          child: ListView.builder(
              itemCount: getList().length,
              itemBuilder: (context, index) => customListView(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MusicApp(msong: song[index]),
                    ),);
                },
                title: song[index].title,
                singer: song[index].singer,
                image: song[index].image,
                path: song[index].path,

              )),
        ),
      ],),
    );

  }
}



