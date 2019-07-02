boolean alive()
{
  for(node v : bullet_array)
  {
    if( v.kill() )
      return false ;
  }
  return true ;
}
