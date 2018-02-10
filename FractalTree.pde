private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = 9.42;  
private double rightCurl = 0;  
private double leftCurl = 0;   
 boolean morr = false;
 boolean lesr = false;
 boolean morl = false;
 boolean lesl = false;
public void setup() 
{   
	size(640,480);    
	//noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(255, 42, 255);   
	strokeWeight(18);
	line(320,480,320,380); 
	if (morr==true  ) {
		rightCurl+= .01;
	}
	if (lesr==true  ) {
		rightCurl-= .01;
	}
		if (morl==true ) {
		leftCurl+= .01;
	}
	if (lesl==true) {
		leftCurl-= .01;
	}  
	drawBranches(320,380,100,3*Math.PI/2,10);  //will add later 
	
} 
public void drawBranches(int x,int y, double branchLength, double angle, int thic) 
{   
	double angle1= angle+rightCurl+branchAngle;
	double angle2= angle-leftCurl-branchAngle;
	branchLength = branchLength*fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	int endX3 = (int) branchLength;
	int endY3 = (int) branchLength;
	strokeWeight(thic);
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);

	//your code here 
	if(branchLength>=smallestBranch){
		if(thic>1){
			thic--;
		}
		drawBranches(endX1,endY1,branchLength,angle1,thic);
		drawBranches(endX2,endY2,branchLength,angle2,thic);
	}
} 
public void keyPressed(){

	if(key=='a'){
		morr = true;
	}
	if(key=='s'){
		lesr = true;
	}
	if(key=='a'){
		morl = true;
	}
	if(key=='s'){
		lesl = true;
	}
}
public void keyReleased(){
	if(key=='a'){
		morr = false;
	}
	if(key=='s'){
		lesr = false;
	}
	if(key=='a'){
		morl = false;
	}
	if(key=='s'){
		lesl = false;
	}
}
