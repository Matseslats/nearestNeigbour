PImage testImg;
void setup(){
  fullScreen();
  testImg = loadImage("input.png");
  
}

void draw(){
  PImage scaledImage = upscale(testImg, 1900, 1000);
  image(scaledImage, 0, 0);
}

PImage upscale(PImage _input, int _width, int _height){
  float scalingW = _width / _input.width;
  float scalingH = _height / _input.height;
  PImage output = createImage(_width, _height, RGB);
  
  _input.loadPixels();
  output.loadPixels();
  for (int inX = 0; inX < _input.width; inX += 1) { 
    for (int inY = 0; inY < _input.height; inY += 1) { 
      color c = _input.pixels[inY*_input.width+inX]; 
      for(int y = int(inY*scalingH); y < (scalingH)*(inY+1); y++){
        for(int x = int(inX*scalingW); x < scalingW*(inX+1); x++){
          output.pixels[y*_width+x] = c;
        }
      }
    }
  }
  
  return output;
}
