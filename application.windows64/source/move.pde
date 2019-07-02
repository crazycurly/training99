void move()
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
