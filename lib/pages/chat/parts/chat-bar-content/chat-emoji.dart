part of '../chat-bar/chat-bar.dart';

class ChatEmoji extends StatefulWidget {
  TextEditingController controller;
  ChatEmoji(this.controller);
  @override
  _ChatEmojiState createState() => _ChatEmojiState();
}

class _ChatEmojiState extends State<ChatEmoji> {
  List<String> emojis;
  @override
  void initState() {
    super.initState();
    emojis=["😀","😁","😂","😃","😄","😅","😆","😉",'😊','😋','😎','😍','😘','😗','😙','😚','😇','😐','😑','😶','😏','😣','😥','😮','😯','😪','😫','😴','😌','😛','😜','😝','😒','😓','😔','😕','😲','😷','😖','😞','😟','😤','😢','😭','😦','😧','😨','😬','😰','😱','😳','😵','😡','😠','💪','👈','👉','☝','👆','👇','✌','✋','👌','👍','👎','✊','👊','👋','👏','👐','✍','🍇','🍈','🍉','🍊','🍋','🍌','🍍','🍎','🍏','🍐','🍑','🍒','🍓'];
  }
  @override
  Widget build(BuildContext context) {
      return Container(
      // padding: EdgeInsets.fromLTRB(20,10,20,0),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height*0.36,
      width: double.infinity,
      child: ListView(
        children: <Widget>[
          Wrap(children:List.generate(emojis.length, 
          (index) => GestureDetector(
            onTap: (){
              print(index);
              
              
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: 30,
              height: 30,
              child: Text("${emojis[index]}",style: TextStyle(fontSize: 25),textAlign: TextAlign.center,),
            ),
          )
          ))
        ],
      ),
    );
  }
}
