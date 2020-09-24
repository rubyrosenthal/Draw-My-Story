void mousePressed() {
  if(mouseX >= firstButtonX && mouseX <= firstButtonX+width && 
     mouseY >= firstButtonY && mouseY <= firstButtonY+height) {
        firstButtonClicked = true;
        secondButtonClicked = false;
      } else if(mouseX >= secondButtonX && mouseX <= secondButtonX+width && 
     mouseY >= secondButtonY && mouseY <= secondButtonY+height) {
       secondButtonClicked = true;
       firstButtonClicked = false;
     } else {
        firstButtonClicked = secondButtonClicked = false;
      }
}

void update(int x, int y) {
  if(mouseHover(firstButtonX, firstButtonY, firstButtonSize, firstButtonSize)){
    mouseHovered = true;
  } else if(mouseHover(secondButtonX, secondButtonY, secondButtonSize, secondButtonSize)){
    mouseHovered = true;
  } else { 
    mouseHovered = false;
  }
}

boolean mouseHover(int x, int y, int width, int height) {
  if(mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
