import processing.serial.* ;

Serial myPort;
char dir;
int px, py ;
ArrayList<node> bullet_array = new ArrayList<node>() ;
final int bullet_size = 5 ;
final int max_bullet_amount = 70 ;
final int movedist = 1 ;
float init_time = 0 ;
boolean press_up, press_down, press_left, press_right;
boolean END = false, START = false ;

void setup()
{
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  frameRate(90) ;
  size(400, 300) ;
  init();
}

void draw()
{
  if (START)
  {
    background(0) ;
    generate_bullet() ;
    move_bullet() ;
    move() ;
  } 
  else
    init();

  if ( !alive() )
  {
    println("alive");
    noLoop();
    String score = nf( (millis()-init_time)/1000, 0, 3) ;
    fill(100, 150, 200);
    textSize(40);
    text("You Die\nScore : "+score, 50, 50) ;
    END = true ;
  }
}

void keyPressed()
{
  START=true;
  if ( END == true && key == ENTER )
  {
    END = false ;
    START = false;
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

void keyReleased() {
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
