int px ,py ;
ArrayList<node> bullet_array = new ArrayList<node>() ;
final int bullet_size = 5 ;
final int max_bullet_amount = 70 ;
final int movedist = 5 ;

void setup()
{
  frameRate(60) ;
  size(400, 300) ;
  background(0) ;
  px = width/2 ;
  py = height/2 ;
}


void draw()
{
  println(millis()) ;
  background(0) ;
  fill(255,255,0) ;
  generate_bullet() ;
  move_bullet() ;
  fill(255) ;
  ellipse(px,py,10,10) ;
  
  if( !alive() )
  {
    stop() ;
    textSize(40);
    fill(100, 150, 200);
    float score = millis() ;
    text("You Die\nScore : "+score/1000,50,50) ;
  }
}

void keyPressed()
{
  if( key == CODED )
  {
    if( keyCode == UP )
      py -= movedist ;
    else if( keyCode == DOWN )
      py += movedist ;
    else if( keyCode == LEFT )
      px -= movedist ;
    else if( keyCode == RIGHT )
      px += movedist ;
  }
}
