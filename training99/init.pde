void init()
{
  bullet_array.clear() ;
  init_time = millis() ;
  press_up = press_down = press_left = press_right = false ;
  px = width/2 ;
  py = height*3/4 ;
  background(0) ;
  textSize(30);
  fill(100, 150, 200);
  text("Press any key to start",50, 50) ;
}
