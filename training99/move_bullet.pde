void move_bullet()
{
  for(node v : bullet_array)
  {
    v.move() ;
    ellipse( v.x, v.y, bullet_size, bullet_size ) ;
  }
  for(int i = 0 ; i < bullet_array.size() ; i++)
    if( !bullet_array.get(i).legal() )
      bullet_array.remove(i) ;
}
