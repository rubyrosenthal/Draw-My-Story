import websockets.*;
import cbl.quickdraw.*;

WebsocketServer socket;

String[] sketches = {"alarm", "ambulance", "angel", "apple", "banana", "basket", "bath",
                     "bear", "bee", "bird", "book", "brain", "bridge", "bus", "camera",
                     "candle", "carrot", "castle", "cat", "chair", "circle", "cloud",
                     "computer", "cookie", "crab", "crown", "duck", "dog", "door", 
                     "ear", "eye", "face", "finger", "flower", "fork", "frog", 
                     "garden", "glasses", "guitar", "hand", "hat", "headphones", 
                     "horse", "house", "ice-cream", "key", "laptop", "leaf", "lighter", "lipstick",
                     "lollipop", "microphone", "monkey", "mountain", "mouse", "necklace", 
                     "octopus", "paintbrush", "parrot", "pencil", "phone", "piano", 
                     "pig", "purse", "rabbit", "shark", "shoe", "shorts", "skull", 
                     "snail", "sofa", "squirrel", "stairs", "strawberry", "sun", 
                     "t-shirt", "teapot", "tv", "underwear", "watch", "watermelon"};
                                        
QuickDraw[] qd = new QuickDraw[81];

String newMessage = " ";
int index;
float end, x;
ArrayList<String> history;
boolean did_print = false;
int timer;
String[] topics = {"animals", "food", "hobbies", "nature", "the face", "the house"};
int chosenTopic = int(random(topics.length));

color rectangleBlue, rectanglePink;
int firstButtonX, firstButtonY; // position of rectangle
int firstButtonSize = 213; //diameter
int secondButtonX, secondButtonY; // position of rectangle
int secondButtonSize = 213; //diameter
boolean firstButtonClicked = false;
boolean secondButtonClicked = false;
boolean mouseHovered = false;

void setup() {
  size(595, 775);
  socket = new WebsocketServer(this, 1337, "/p5websocket");
  for(int i = 0; i < 81; i++) { 
    qd[i] = new QuickDraw(this, sketches[i] + ".ndjson"); 
} 
  history = new ArrayList<String>();
  
  firstButtonX = 355;
  firstButtonY = 670;
  secondButtonX = 355;
  secondButtonY = 670;
  rectangleBlue = color(230,230,250);
  rectanglePink = color(255,192,203);
}

void draw() {
  update(mouseX, mouseY);
  background(253,250,242); //248, 248, 255
  
  if(!firstButtonClicked && !secondButtonClicked) {
    drawScreen2();
  } if(firstButtonClicked && !secondButtonClicked){
    drawScreen3();
  } if(firstButtonClicked && secondButtonClicked) {
    drawScreen3();
  }
}

// Update end back and forth between 0 and 1 
// This draws and re-draws the sketch

void endUpdate() {
  float inc = .01;
  end = abs(sin(x));
  x = x + inc;
}

void webSocketServerEvent(String msg){
 println(msg);
 newMessage = new String(msg);
}
