void serialEvent(Serial p) {
  if ( p.available() > 0) {
    dir = p.readChar();
    println(dir);
    if(dir!='\r' && dir !='\n')
      START=true;
  }
  switch(dir) {
  case '0':
    press_up=true;
    press_down=false;
    press_left=false;
    press_right=false;
    break;
  case '1':
    press_up=true;
    press_down=false;
    press_left=false;
    press_right=true;
    break;
  case '2':
    press_up=false;
    press_down=false;
    press_left=false;
    press_right=true;
    break;
  case '3':
    press_up=false;
    press_down=true;
    press_left=false;
    press_right=true;
    break;
  case '4':
    press_up=false;
    press_down=true;
    press_left=false;
    press_right=false;
    break;
  case '5':
    press_up=false;
    press_down=true;
    press_left=true;
    press_right=false;
    break;
  case '6':
    press_up=false;
    press_down=false;
    press_left=true;
    press_right=false;
    break;
  case '7':
    press_up=true;
    press_down=false;
    press_left=true;
    press_right=false;
    break;
  case '8':
    press_up=false;
    press_down=false;
    press_left=false;
    press_right=false;
    break;
  case 'e':
    if ( END ) {
      END = false ;
      START = false;
      loop() ;
    }
    break;
  }
}
