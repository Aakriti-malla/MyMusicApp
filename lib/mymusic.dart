import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/src/audio_cache.dart';


import 'main.dart';
void main() {
  runApp(const MyApp());
}
class MusicApp extends StatefulWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  _MusicAppState createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  bool playing = false;
  IconData playBtn = Icons.play_circle_outline;
  AudioPlayer _player= AudioPlayer();
  AudioCache cache= AudioCache();
  Duration position = new Duration();
  Duration musicLength = new Duration();

  Widget slider() {
    return Container(
      width: 300,
      child: Slider.adaptive(
        activeColor: Colors.blueAccent,
        inactiveColor: Colors.grey,
        value: position.inSeconds.toDouble(),
        max:musicLength.inSeconds.toDouble(),
        onChanged: (value)
        {
          seekTosec(value.toInt());
        },),
    );
  }

  void seekTosec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }
  void initState(){
    super.initState();
    _player=AudioPlayer();
    cache=AudioCache(fixedPlayer: _player);
    _player.onDurationChanged.listen((d){
      setState((){
        musicLength=d;
      });

    });
    _player.onAudioPositionChanged.listen((p){
      setState((){
        position=p;
      });
    });

  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration:BoxDecoration(gradient: LinearGradient(begin:Alignment.topLeft,
            end:Alignment.bottomRight,
            colors:[Colors.pink,
              Colors.pinkAccent,]),
        ),
        child:Padding(
          padding:EdgeInsets.only(
            top:40.0,
          ),
          child: Container(
            child:Column(
              mainAxisAlignment:MainAxisAlignment.start,
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                Padding(
                  padding:const EdgeInsets.only(left:12.0),
                  child:Text(
                    "Musically",
                    style:TextStyle(
                      color: Colors.white,
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height:24.0,
                ),
                Center(
                  child:Container(
                    width: 280.0,
                    height: 280.0,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(30.0),
                      image:DecorationImage(
                        image: AssetImage("assets/1st.gif"),
                      ),
                    ),

                  ),
                ),
                SizedBox(
                  height:20.0,
                ),
                Center(
                  child: Text(
                    "its you",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height:30.0,
                ),
                Expanded(child: Container(
                  decoration:BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),

                    ),
                  ),
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      Container(
                        width:500.0,
                        child:Row(
                          mainAxisAlignment:MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Text("${position.inMinutes}:${position.inSeconds.remainder(60)}",
                              style: TextStyle(fontSize:18.0,),
                            ),
                            slider(),
                            Text("${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                              style: TextStyle(fontSize:18.0,),

                            ),
                          ],
                        ),

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            iconSize: 45.0,
                            color:Colors.blue[500],
                            onPressed:(){

                            },
                            icon: Icon(
                              Icons.skip_previous,
                            ),
                          ),
                          IconButton(
                            iconSize: 60.0,
                            color:Colors.blue[800],
                            onPressed:(){
                              if(!playing){
                                cache.play("song.mp3");
                                setState((){
                                  playBtn=Icons.pause_circle_outline;
                                  playing=true;
                                });
                              }
                              else{
                                _player.pause();
                                setState((){
                                  playBtn=Icons.play_circle_outline;
                                  playing=false;
                                });
                              }

                            },

                            icon: Icon(
                                playBtn
                            ),
                          ),
                          IconButton(
                            iconSize: 45.0,
                            color:Colors.blue[500],
                            onPressed:(){},
                            icon: Icon(
                              Icons.skip_next,
                            ),
                          ),


                        ],),
                    ],),

                ),),],
            ),
          ),
        ),
      ), );

  }
}