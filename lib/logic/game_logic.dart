import 'dart:io';

class TicTacToe {
  var game = [
    [0,0,0],
    [0,0,0],
    [0,0,0],
  ];
  var slot = [
    [0,0,0],
    [0,0,0],
    [0,0,0],
  ];
  int side1Win =0;
  int side2Win =0;
  var x_possible=[0,0,0];
  var y_possible=[0,0,0];
  var cross_possible=[0,0];

  void calculatePoint(int x,int y, int id){
    var posx = x-1;
    var posy = y-1;
    ////////////// start get score /////////////
    if(slot[posx][posy] == 0){
      x_possible[posx] += id;
      y_possible[posy] += id;

      if(posx == posy || (posx == 0 && posy == 2) || (posx == 2 && posy == 0)){
        if(posx == posy){
          cross_possible[0] += id;
          if(posx == 1){
            cross_possible[1] += id;
          }
        }
        else{
          cross_possible[1] += id;
        }
      }

      slot[posx][posy] = 1;
    }
    ////////////// end get score /////////////
  }
  bool getWinner(){
    var x_empty = [0,0,0];
    var y_empty = [0,0,0];
    var cross_empty = [0,0];
    int all_full = 0;
    for(int i=0;i<3;i++){
      for(int j=0;j<3;j++){
        if(slot[i][j] == 0){
          x_empty[i] = 1;
          y_empty[j] = 1;
          if(i == j || (i == 0 && j == 2) || (i == 2 && j == 0)){
            if(i == j){
              cross_empty[0] = 1;
              if(i == 1){
                cross_empty[1] = 1;
              }
            }
            else{
              cross_empty[1] = 1;
            }
          }
        }
      }
    }
    for(int i=0;i<3;i++){
      for(int j =0;j<3;j++){
        if(x_empty[i] == 0 ){
          if(x_possible[i] == 6 ){
            print("Side 2 Win !");
            side2Win += 1;
            resetGame();
            return true;
          }
          else if(x_possible[i] == 3){
            print("Side 1 Win !");
            side1Win += 1;
            resetGame();
            return true;
          }
        }
        else if(y_empty[j] == 0 ){
          if(y_possible[j] == 6 ){
            print("Side 2 Win !");
            side2Win += 1;
            resetGame();
            return true;
          }
          else if(y_possible[j] == 3){
            print("Side 1 Win !");
            side1Win += 1;
            resetGame();
            return true;
          }
        }
      }
      if(i<2){
        if(cross_empty[i] == 0){
          if(cross_possible[i] == 6){
            print("Side 2 Win Cross!");
            side2Win += 1;
            resetGame();
            return true;
          }
          else if(cross_possible[i] == 3){
            print("Side 1 Win Cross!");
            side1Win += 1;
            resetGame();
            return true;
          }
        }
      }
    }
    for(int i=0;i<3;i++){
      for(int j=0;j<3;j++){
        if(slot[i][j] == 1){all_full+=1;}
      }
    }
    if(all_full == 9){
      print("Draw!");
      resetGame();
      return false;
    }
    else{
      return false;
    } 
  }
  void side1play(int x,int y){
    if(x > 3 || y > 3 || x < 0 || y < 0){
      print("Wrong slot. Try again.");
    }
    else if(game[x-1][y-1] == 2){
      print("Side2 Already play this slot.");
    }
    else if(game[x-1][y-1] == 1){
      print("You Already play this slot.");
    }
    else{
      game[x-1][y-1] = 1;
    }
  }
  void side2play(int x,int y){
    if(x > 3 || y > 3 || x < 0 || y < 0){
      print("Wrong slot. Try again.");
    }
    else if(game[x-1][y-1] == 2){
      print("You Already play this slot.");
    }
    else if(game[x-1][y-1] == 1){
      print("Side1 Already play this slot.");
    }
    else{
      game[x-1][y-1] = 2;
    }
  }
  void resetGame(){
    for(var i = 0;i<3;i++){
      for(var j = 0;j<3;j++){
        game[i][j] = 0;
        slot[i][j] = 0;
      }
      x_possible[i]=0;
      y_possible[i]=0;
    }
    cross_possible[0]=0;
    cross_possible[1]=0;
  }
  void resetSession(){
    resetGame();
    side1Win = 0;
    side2Win = 0;
  }
  void printCurrentGame(){
    print("-----Current Game-----");
    for(var i = 0;i<3;i++){
      for(var j = 0;j<3;j++){
        var n = game[i][j];
        stdout.write("   $n   ");
      }
      stdout.write("\n");
    }
    print("----------------------");
  }
  int getSide1Win(){
    return side1Win;
  }
  int getSide2Win(){
    return side2Win;
  }
}