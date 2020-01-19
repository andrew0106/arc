/*
  morseCode Generator
  Chia Yang Chang (Andrew)
  2019
*/

/*
  Acknowledgments
  This Template is inspired by:
    RandomBook.pde example
    https://github.com/processing/processing/blob/master/java/libraries/pdf/examples/RandomBook/RandomBook.pde
  
*/

int indext = 0;
String[] words;  

import processing.pdf.*;

PGraphicsPDF pdf;

void setup(){
  size(600,700);
  frameRate(30);
  String []lines = loadStrings("ours.txt");   // read the txt file
  String lyric = join(lines," ");       // join together instead of each array
  words = splitTokens(lyric," ,.':!?"); // split any pountuation mark 
  printArray(words);    //test the result
  
  pdf = (PGraphicsPDF)beginRecord(PDF, "RandomBook.pdf");     //safe to pdf file
  beginRecord(pdf);       //start to save
}



void draw(){
  
  background(255);
  
  // its include some info that i would like to look back so i save it
  
  //String[] nums= split(s," "); // 他們之間的區隔
  //String A = join(nums," ");  // joing together 變成一塊而不是每行一個array
  //words=splitTokens(A," ,.:!?"); //帶入篩選條件
  
  //frameCount=1;
  
  //if(frameCount %1==0){    // save the cover
  // drawCover();
  // pdf.nextPage();
  //}
  
  if(frameCount %1==0){        // start to change different word to page from page1
    String voc = words[indext].toLowerCase();   
    indext+=1;
    wordVisul(voc);
  
  }
 if(frameCount==1){    // draw the cover
   drawCover();
   pdf.nextPage();
   
 }else if (frameCount==300){     // make it stop when its run every words
   //rect(200,200,100,100);
   endRecord();
   exit();  // Quit
 
 }
 
 else{
  pdf.nextPage(); 
 }
}



void wordVisul(String voc){      // wordvisul founction
  for(int i=0;i<voc.length();i++){
      
      char textWord = voc.charAt(i);   // make the word in to line like  a
                                                                      // b
      // the valut of the rect and ellipse's gap                      // c
      float gap=60*i;    
      float rectGap=70;
      float cirGap=25;
      float cirRGap=80;
      
      
      fill(0);
      textAlign(CENTER);
      textSize(50);
      
      text(textWord,width/4,60+gap);
      //textWord+=1;
      
      noStroke();
      
      // call different word's morse code
      
      if(textWord == 'a'){
        ellipse(width/3,35+gap+15/2,15,15);
        rect(width/3+cirGap,35+gap,60,15,5); 
     }
     else if(textWord == 'b'){
       rect(width/3,35+gap,60,15,5); 
       ellipse(width/3+cirRGap,35+gap+15/2,15,15);
       ellipse(width/3+cirRGap+cirGap,35+gap+15/2,15,15);
       ellipse(width/3+cirRGap+cirGap*2,35+gap+15/2,15,15);
     }
     else if(textWord == 'c'){
       rect(width/3,35+gap,60,15,5); 
       ellipse(width/3+cirRGap,35+gap+15/2,15,15);
       rect(width/3+cirRGap+cirGap,35+gap,60,15,5); 
       ellipse(width/3+cirRGap*2+cirGap,35+gap+15/2,15,15);
     } 
     else if(textWord == 'd'){
       rect(width/3,35+gap,60,15,5); 
       ellipse(width/3+cirRGap,35+gap+15/2,15,15);
       ellipse(width/3+cirRGap+cirGap,35+gap+15/2,15,15);
       
    
     }
     else if(textWord == 'e'){
       ellipse(width/3,35+gap+15/2,15,15);
     }
     else if(textWord == 'f'){
       ellipse(width/3,35+gap+15/2,15,15);
       ellipse(width/3+cirGap,35+gap+15/2,15,15);
       rect(width/3+cirGap*2,35+gap,60,15,5); 
       ellipse(width/3+cirGap*2+cirRGap,35+gap+15/2,15,15);
     }
     else if(textWord == 'g'){
       rect(width/3,35+gap,60,15,5); 
       rect(width/3+rectGap,35+gap,60,15,5); 
       ellipse(width/3+rectGap+cirRGap,35+gap+15/2,15,15);
       
     }
     else if(textWord == 'h'){
       ellipse(width/3,35+gap+15/2,15,15);
       ellipse(width/3+cirGap,35+gap+15/2,15,15);
       ellipse(width/3+cirGap*2,35+gap+15/2,15,15);
       ellipse(width/3+cirGap*3,35+gap+15/2,15,15);
     }
     else if(textWord == 'i'){
       ellipse(width/3,35+gap+15/2,15,15);
       ellipse(width/3+cirGap,35+gap+15/2,15,15);
     }
     else if(textWord == 'j'){
       ellipse(width/3,35+gap+15/2,15,15);
       rect(width/3+cirGap,35+gap,60,15,5);
       rect(width/3+rectGap+cirGap,35+gap,60,15,5);
       rect(width/3+rectGap*2+cirGap,35+gap,60,15,5);
       
     }
     else if(textWord == 'k'){
       rect(width/3,35+gap,60,15,5); 
       ellipse(width/3+cirRGap,35+gap+15/2,15,15);
       rect(width/3+cirRGap+cirGap,35+gap,60,15,5); 
       
     }
     else if(textWord == 'l'){
       ellipse(width/3,35+gap+15/2,15,15);
       rect(width/3+cirGap,35+gap,60,15,5);
       ellipse(width/3+cirGap+cirRGap,35+gap+15/2,15,15);
       ellipse(width/3+cirGap*2+cirRGap,35+gap+15/2,15,15);
     }
     else if(textWord == 'm'){
        rect(width/3,35+gap,60,15,5);
        rect(width/3+rectGap,35+gap,60,15,5); 
     }
     else if(textWord == 'n'){
       rect(width/3,35+gap,60,15,5); 
       ellipse(width/3+cirRGap,35+gap+15/2,15,15);
     }
     else if(textWord == 'o'){
       rect(width/3,35+gap,60,15,5); 
       rect(width/3+rectGap,35+gap,60,15,5); 
       rect(width/3+rectGap*2,35+gap,60,15,5); 
       rect(width/3+rectGap*3,35+gap,60,15,5); 
       
     }
     else if(textWord == 'p'){
       ellipse(width/3,35+gap+15/2,15,15);
       rect(width/3+cirGap,35+gap,60,15,5);
       rect(width/3+rectGap+cirGap,35+gap,60,15,5);
       ellipse(width/3+cirGap+cirRGap*2,35+gap+15/2,15,15);
     }
     else if(textWord == 'q'){
       rect(width/3,35+gap,60,15,5); 
       rect(width/3+rectGap,35+gap,60,15,5); 
       ellipse(width/3+rectGap+cirRGap,35+gap+15/2,15,15);
       rect(width/3+rectGap+cirGap,35+gap,60,15,5); 
     }
     else if(textWord == 'r'){
       ellipse(width/3,35+gap+15/2,15,15);
       rect(width/3+cirGap,35+gap,60,15,5);
       ellipse(width/3+cirGap+cirRGap,35+gap+15/2,15,15);
     }
     else if(textWord == 's'){
       ellipse(width/3,35+gap+15/2,15,15);
       ellipse(width/3+cirGap,35+gap+15/2,15,15);
       ellipse(width/3+cirGap*2,35+gap+15/2,15,15);
       
     }
     else if(textWord == 't'){
       rect(width/3,35+gap,60,15,5);
     }
     else if(textWord == 'u'){
       ellipse(width/3,35+gap+15/2,15,15);
       ellipse(width/3+cirGap,35+gap+15/2,15,15);
       rect(width/3+cirGap*2,35+gap,60,15,5); 
       
     }
     else if(textWord == 'v'){
       ellipse(width/3,35+gap+15/2,15,15);
       ellipse(width/3+cirGap,35+gap+15/2,15,15);
       ellipse(width/3+cirGap*2,35+gap+15/2,15,15);
       rect(width/3+cirGap*3,35+gap,60,15,5);
     }
     else if(textWord == 'w'){
       ellipse(width/3,35+gap+15/2,15,15);
       rect(width/3+cirGap,35+gap,60,15,5);
       rect(width/3+rectGap+cirGap,35+gap,60,15,5);
     }
     else if(textWord == 'x'){
       rect(width/3,35+gap,60,15,5); 
       ellipse(width/3+cirRGap,35+gap+15/2,15,15);
       ellipse(width/3+cirRGap+cirGap,35+gap+15/2,15,15);
       rect(width/3+cirRGap+cirGap*2,35+gap,60,15,5); 
       
     }
     else if(textWord == 'y'){
       rect(width/3,35+gap,60,15,5); 
       ellipse(width/3+cirRGap,35+gap+15/2,15,15);
       rect(width/3+cirRGap+cirGap,35+gap,60,15,5);
       rect(width/3+cirRGap+cirGap+rectGap,35+gap,60,15,5); 
      
     }
     else if(textWord == 'z'){
       rect(width/3,35+gap,60,15,5); 
       rect(width/3+rectGap,35+gap,60,15,5); 
       ellipse(width/3+rectGap+cirRGap,35+gap+15/2,15,15);
       ellipse(width/3+rectGap+cirRGap+cirGap,35+gap+15/2,15,15);
       
     }
     
    
    }

 
}

void drawCover(){
  // FIRST PAGE
  fill(0);
  //textFont(titleFont);
  textAlign(CENTER, CENTER);
  textSize(50);
  text("code",width/4+45, height/2);
  //textFont(pageFont);
  textAlign(RIGHT);
  textSize(20);
  text("Chia Yang Chang",width-100, height/2+ 280);
  textSize(15);
  text("12/09/2019",width-100, height/2+ 310);
}
