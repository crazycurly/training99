import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class training99 extends PApplet {

int px, py ;
ArrayList<node> bullet_array = new ArrayList<node>() ;
final int bullet_size = 5 ;
final int max_bullet_amount = 70 ;
final int movedist = 1 ;
float init_time = 0 ;
boolean press_up, press_down, press_left, press_right;
boolean END = true ;
public void setup()
{
  frameRate(90) ;
  
  background(0) ;
  px = width/2 ;
  py = height*3/4 ;

}
public void draw()
{
  background(0) ;
  generate_bullet() ;
  move_bullet() ;
  move() ;

  if ( !alive() )
  {
    //stop() ;
    noLoop() ;
    textSize(40);
    fill(100, 150, 200);
    String score = nf( (millis()-init_time)/1000, 0, 3) ;
    text("You Die\nScore : "+score, 50, 50) ;
    END = true ;
  }
}
public void keyPressed()
{
  if( END == true && key == ENTER )
  {
    END = false ;
    init() ;
    loop() ;
  }
  if ( key == CODED )
  {
    if ( keyCode == UP )
      press_up = true;
    else if ( keyCode == DOWN )
      press_down = true;
    else if ( keyCode == LEFT )
      press_left = true;
    else if ( keyCode == RIGHT )
      press_right = true;
  }
}
public void keyReleased() {
  if ( key == CODED )
  {
    if ( keyCode == UP )
      press_up = false;
    else if ( keyCode == DOWN )
      press_down = false;
    else if ( keyCode == LEFT )
      press_left = false;
    else if ( keyCode == RIGHT )
      press_right = false;
  }
}
public boolean alive()
{
  for(node v : bullet_array)
  {
    if( v.kill() )
      return false ;
  }
  return true ;
}
public void generate_bullet()
{
  if( bullet_array.size() > max_bullet_amount )
    return ;
  
  float rx = random(0, width) ;
  float ry = 0 ;
  int rand = PApplet.parseInt(random(4)) ;
  if( rand == 1 )
  {
    rx = random(0, width) ;
    ry = height ;
  }
  else if( rand == 2 )
  {
    rx = 0 ;
    ry = random(0, height) ;
  }
  else if( rand == 3 )
  {
    rx = width ;
    ry = random(0, height) ;
  }
  
  float dx = px - rx ;
  float dy = py - ry ;
  
  node tmp = new node(rx,ry,dx,dy) ;
  bullet_array.add(tmp) ;
}
public void init()
{
  bullet_array.clear() ;
  init_time = millis() ;
  press_up = press_down = press_left = press_right = false ;
  px = width/2 ;
  py = height*3/4 ;
}
public void move()
{
  if ( press_up )
    py -= movedist ;
  if ( press_down )
    py += movedist ;
  if ( press_left)
    px -= movedist ;
  if ( press_right )
    px += movedist ;
  
  if( py < 0 )
    py = 0 ;
  if( py > height )
    py = height ;
  if( px < 0 )
    px = 0 ;
  if( px > width )
    px = width ;
  
  fill(255) ;
  ellipse(px, py, 10, 10) ;
}
public void move_bullet()
{
  fill(255, 255, 0) ;
  for(node v : bullet_array)
  {
    v.move() ;
    ellipse( v.x, v.y, bullet_size, bullet_size ) ;
  }
  for(int i = 0 ; i < bullet_array.size() ; i++)
    if( !bullet_array.get(i).legal() )
      bullet_array.remove(i) ;
}
public class node
{
  float x, y, dx, dy ;
  node(float x, float y, float dx, float dy)
  {
    this.x = x ;
    this.y = y ;
    this.dx = dx/sqrt(dx*dx+dy*dy) ;
    this.dy = dy/sqrt(dx*dx+dy*dy) ;
  }
  public void move()
  {
    x += dx ;
    y += dy ;
  }
  public boolean legal()
  {
    if( x < 0 || x > width || y < 0 || y > height )
      return false ;
    return true ;
  }
  public boolean kill()
  {
    float dist = sqrt( (x-px)*(x-px) + (y-py)*(y-py) ) ;
    if( dist < 5 )
      return true ;
    return false ;
  }
}
  public void settings() {  size(400, 300) ; }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "training99" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
