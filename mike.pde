import ddf.minim.*;

Minim minim;
AudioInput in;
float volume;
float w,x,y;
float n=1.2;
int i=0;

void setup() {
  fullScreen();
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 512);
  frameRate(60);
  noStroke();
}

void draw() {
  if (i%10==0)background(0);
  volume = map((in.left.level()+in.right.level())/2, 0, 0.5, 0, 1000);
  if (volume>20){
    if (w<volume){
      x=w+1;
      y=w+1;
      w=w+1;
    }else{
      x=w-1;
      y=w-1;
      w=w-1;
    }
    fill(200-w*n, 255, 255,255);
    ellipse(random(width), random(height), volume*n, volume*n);
    fill(255-w*n, 255, 255,200);
    rect(width/2-volume*n/2, height/2-volume*n/2, volume*n, volume*n);
  }else{
    fill(200-w*n, 255, 255,200);
    float t=random(50,100);
    rect(width/2-t/2, height/2-t/2, t, t);
  }
  i=i+1;
}

void stop(){
  in.close();
  minim.stop();
  super.stop();
}