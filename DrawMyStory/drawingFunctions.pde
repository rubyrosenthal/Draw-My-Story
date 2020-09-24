void drawScreen1() {
    stroke(rectangleBlue);
    fill(rectangleBlue); 
    rect(5, 5, 585, 50);
    
    fill(255);
    textSize(25);
    text("Draw My Feelings", 30, 40);
    
    pushStyle();
    fill(161, 202, 241);
    textSize(15);
    text("Welcome to Draw My Story!", 20, 90);
    text("This is a speech-recognition system which picks up on your words and turns", 20, 120);
    text("them into doodles!", 20, 150);
    text("When you have finished reading these instructions, open a broswer", 20, 180);
    text("and navigate to:  https://codepen.io/rubyrosenthal/pen/BaKOdRW", 20, 210);
    text("Allow your microphone, keep the tab open, and return to this window.", 20, 240);
    text("CLick 'next' then start talking!", 20, 270);
    text("Feel free to describe your day, tell a story, or talk about your hobbies!", 20, 300);
    text("After 1 minute you will be able to see a collection of all the doodles your", 20, 330);
    text("words created.", 20, 360);
    text("The page with doodles will automatically save to your computer", 20, 390);
    text("You can then print out the page and use it for some mindfulness colouring!", 20,410);
    
    text("Here is a prompt to help you get started...", 20,440);
    
    timer = millis()/1000; 
    if (timer >= 10) {
      textSize(30);
      text(topics[chosenTopic], 350,470);
    }
    
    timer = millis()/1000; 
    if(timer == 30 || timer >= 30) {
    if(mouseHovered) {
      fill(rectanglePink);
    } else {
      fill(rectangleBlue);
    }
    stroke(255);
    rect(firstButtonX, firstButtonY, firstButtonSize, firstButtonSize);
    
    fill(255);
    textSize(18);
    text("Next", 400, 730);
    popStyle();
  }
}

void drawScreen2() {
    stroke(rectangleBlue);
    fill(rectangleBlue); //180,231,160
    rect(5, 5, 585, 50);
    
    fill(255);
    textSize(25);
    text("Draw My Feelings", 30, 40);
    
    stroke(0);
    fill(0);
    textSize(23);
    text(newMessage, 30, 140);
  
/* 
millis function counts the miliseconds that the program has been running for.
when it reaches 300 seconds, so 5 minutes, a button will appear for the user
to navigate to the next page 
*/
    
  timer = millis()/1000; 
  
  if(timer <= 89) {
    fill(255);
    rect(30, 180, 540, 500);
    
    stroke(255,192,203);
    fill(253, 253, 150);
    rect(545, 75, 7, 50);
    rect(535, 75, 7, 50);
    rect(525, 75, 7, 50);
    rect(515, 75, 7, 50);
    rect(505, 75, 7, 50);
    rect(495, 75, 7, 50);
  }
  // removing a bar as time goes down
  if(timer >= 39) {
    stroke(255,192,203);
    fill(255);
    rect(495, 75, 7, 50);
  } if(timer >= 49) {
    stroke(255,192,203);
    fill(255);
    rect(505, 75, 7, 50);
  } if(timer >= 59) {
    stroke(255,192,203);
    fill(255);
    rect(515, 75, 7, 50);
  } if(timer >= 69) {
    stroke(255,192,203);
    fill(255);
    rect(525, 75, 7, 50);
  } if(timer >= 79) {
    stroke(255,192,203);
    fill(255);
    rect(535,75, 7, 50);
  } if(timer >= 89) {
    stroke(255,192,203);
    fill(255);
    rect(545, 75, 7, 50);
  }
  
  if(timer == 90 || timer >= 90) {
    if(mouseHovered) {
      fill(rectanglePink);
    } else {
      fill(rectangleBlue);
    }
    stroke(255);
    rect(secondButtonX, secondButtonY, secondButtonSize, secondButtonSize);
    
    fill(0);
    textSize(18);
    text("Test Completed", 380, 700);
    text("Click here to see your ", 355, 730);
    text(" doodles!", 410, 750);
  }
  
  float scale = height/2;

  endUpdate();
  index = 15;
  
  String[] words = split(newMessage, " ");
  
  for(int wordsInSentence = 0; wordsInSentence < words.length; wordsInSentence++) {
    for(int whichSketch = 0; whichSketch < sketches.length; whichSketch++) {
    if(words[wordsInSentence].equals(sketches[whichSketch])){
      history.add(sketches[whichSketch]);
      stroke(0);
      fill(255);
     qd[whichSketch].create(width/2, height/2, scale, scale, index, end);
   } else {
    textSize(32);
    strokeWeight(3);
    stroke(255,192,203);
    fill(255,192,203);
    text("listening...", 10, 110);
   }
  }
 }
}
  
void drawScreen3() {
  stroke(rectangleBlue);
  fill(rectangleBlue); 
  rect(5, 5, 585, 50);
  
  fill(255);
  textSize(25);
  text("Draw My Feelings", 30, 40);
  
  float scale = height/4;
  int col = 1; 
  int row = 1;
  int printWidth = 595 / 3;
  int printHeight = 775 / 4;
  
  stroke(0);
  fill(255);
  
  ArrayList<String> newHistory = removeDuplicates(history);
  
   for(int historyLog = 0; historyLog < newHistory.size(); historyLog++) {
    for(int whichSketch = 0; whichSketch < sketches.length; whichSketch++) {
      String wordInHistory = newHistory.get(historyLog);
      if(wordInHistory.equals(sketches[whichSketch])){
        for(int image = 0; image < newHistory.size(); image++) {
          qd[whichSketch].create(printWidth*col, printHeight*row, scale, scale);
        }
        col = col + 1;
        if(col == 3) {
          col = 1;
          row = row + 1;
      }
    } 
  }
 }
 save("mindfulness-doodles.png");
}
  
ArrayList<String> removeDuplicates(ArrayList<String> history) {
  ArrayList<String> newHistory = new ArrayList<String>();
  for(String specificWord : history) {
    if(!newHistory.contains(specificWord)) {
      newHistory.add(specificWord);
    }
}
return newHistory;
}
