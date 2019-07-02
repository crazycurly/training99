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
  void move()
  {
    x += dx ;
    y += dy ;
  }
  boolean legal()
  {
    if( x < 0 || x > width || y < 0 || y > height )
      return false ;
    return true ;
  }
  boolean kill()
  {
    float dist = sqrt( (x-px)*(x-px) + (y-py)*(y-py) ) ;
    if( dist < 5 )
      return true ;
    return false ;
  }
}
