class VanishingCircle {
  int xPoint, yPoint, minSize, minOpacity;
  float r,g,b, size, opacity, shakeRange;
  boolean completed;
  
  VanishingCircle(int s, int o, int x, int y){
   opacity = o;
   xPoint = x;
   yPoint = y;
   size = s;
   r = random(255);
   g = random(255);
   b = random(255);
   shakeRange = 15;
   minSize = 1;
   minOpacity = 1;
   completed = false;
  }
  
  void update(){
    if(!completed){
      
      if(size > minSize){
         size = size - size/100.0;
      }
      if(opacity > minOpacity){
         opacity = opacity - opacity/100.0;
      }
      if(opacity > minOpacity || size > minSize){
         shakeRange = shakeRange - shakeRange/100.0;
         xPoint = xPoint + int(random(-shakeRange,shakeRange));
         yPoint = yPoint + int(random(-shakeRange,shakeRange));
         
         //lower color
         r = r - r/100;
         g = g - g/100;
         b = b - b/100;

         createCircle();
      }else{
        completed = true;
      }
    }
  }
  
  void createCircle(){
       stroke(b,g,r,opacity);
       fill(r,g,b,opacity);
       ellipse(xPoint,yPoint,size,size);
  }
}