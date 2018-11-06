/*
   AUTHOR:  Maya Montgomery
   DATE:    6/5/18
   
   An implementation of the classic Snake game. Control the snake
   with the arrow keys; you can only make a right or a left from
   your current direction (e.g. if you are moving left, only
   the 'down' and 'up' keys will have an effect). Snacks will
   randomly appear on the screen; eat one and you grow slightly
   longer. Don't hit the walls or yourself, or it's game over! 
*/

Snake snake;              // snake controlled by user
boolean gameover;         // gameover status
ArrayList<Snack> snacks;  // list of randomly appearing snacks

void setup() {
  size(600, 600);
  textAlign(CENTER, CENTER);
  newGame();
}

void newGame() {
  snake = new Snake(color(#0C8311));   // create new snake
  snacks = new ArrayList<Snack>();     // create empty snack list
  gameover = false;                    // clear gameover status
}

void draw() {
  
  // pause briefly
  //delay(50);       // desktop version
  frameRate(15);     // web version (Processing.js doesn't support delay)
  background(255);
  
  // display randomly appearing snacks
  addSnacks();
  for (Snack s : snacks)
    s.display();
  
  // display snake (on top of snacks)
  snake.display();
      
  // display gameover screen if applicable
  if (gameover) {
    displayGameover();
    return;
  }
  
  // move snake and check for snacks to eat
  snake.move();
  snake.checkForSnacks(snacks);
  
  // check for gameover
  if (snake.outOfBounds(width, height) || snake.selfCollision()) {
    gameover = true;
    snake.setColor(color(#84FC05));
  }
}

void keyPressed() {
  
  // check for snake movement
  if (key == CODED) {
    if (keyCode == UP)
      snake.setDirection("up");
    else if (keyCode == DOWN)
      snake.setDirection("down");
    else if (keyCode == RIGHT)
      snake.setDirection("right");
    else if (keyCode == LEFT)
      snake.setDirection("left");
  }
  
  // check for new game request
  if (gameover && key == ' ')
    newGame();
}

void addSnacks() {
  
  // don't add more snacks after gameover
  if (gameover)
    return;
    
  // 3% chance of adding randomly placed snack (max out at 10)
  int snackSize = 8;
  if (random(1) < 0.03 && snacks.size() < 10)
    snacks.add(new Snack(int(random(width  - snackSize/2)), 
                         int(random(height - snackSize/2)),
                         snackSize, color(0, 0, 70)));
}

void displayGameover() {
  fill(color(200, 0, 0));  
 
  textSize(64);
  text("GAMEOVER", width/2, height*.25);
  text("Score: " + snake.getScore(), width/2, height*.75);
  
  textSize(18);
  text("Press space to try again.", width/2, height*.9);
}
