int px, py ;
ArrayList<node> bullet_array = new ArrayList<node>() ;
final int bullet_size = 5 ;
final int max_bullet_amount = 70 ;
final int movedist = 1 ;
boolean u, d, l, r;
void setup()
{
  frameRate(90) ;
  size(400, 300) ;
  background(0) ;
  px = width/2 ;
  py = height/2 ;
}


void draw()
{
  background(0) ;
  fill(255, 255, 0) ;
  generate_bullet() ;
  move_bullet() ;
  fill(255) ;
  ellipse(px, py, 10, 10) ;
  if ( u )
    py -= movedist ;
  if ( d )
    py += movedist ;
  if ( l )
    px -= movedist ;
  if ( r )
    px += movedist ;

  if ( !alive() )
  {
    stop() ;
    textSize(40);
    fill(100, 150, 200);
    float score = millis() ;
    text("You Die\nScore : "+score/1000, 50, 50) ;
  }
}

void keyPressed()
{
  if ( key == CODED )
  {
    if ( keyCode == UP )
      u=true;
    else if ( keyCode == DOWN )
      d=true;
    else if ( keyCode == LEFT )
      l=true;
    else if ( keyCode == RIGHT )
      r=true ;
  }
}
void keyReleased() {
  if ( key == CODED )
  {
    if ( keyCode == UP )
      u=false;
    else if ( keyCode == DOWN )
      d=false;
    else if ( keyCode == LEFT )
      l=false;
    else if ( keyCode == RIGHT )
      r=false;
  }
}
