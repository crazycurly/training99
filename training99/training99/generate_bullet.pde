void generate_bullet()
{
  if( bullet_array.size() > max_bullet_amount )
    return ;
  
  float rx = random(0, width) ;
  float ry = 0 ;
  int rand = int(random(4)) ;
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
