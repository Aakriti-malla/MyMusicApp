class SongInfo {
  String songName;
  String songPath;
  String imagePath;
// YOU CAN ADD MORE VARIABLES TO STORE INFO LIKE SINGER, BAND ETC.
  SongInfo(this.songName, this.songPath, this.imagePath);
}
List<SongInfo> songs = [
  SongInfo('Good Days', 'assets/Eastside.mp3', 'assets/good_days.jfif'),
  SongInfo('Eastside', 'assets/Eastside.mp3', 'assets/eastside.jfif'),
  SongInfo('Formula', 'assets/Formula.mp3', 'assets/euphoria.jfif'),
  SongInfo('Forever', 'assets/Forever.mp3', 'assets/euphoria.jfif'),
  SongInfo('Go with u Remix', 'assets/go_with_u.mp3', 'assets/gowithu.jfif')

];
Text(



