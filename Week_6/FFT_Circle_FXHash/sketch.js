let mic, fft;

function setup() {
  createCanvas(700, 700);
  noFill();

  mic = new p5.AudioIn();
  mic.start();
  fft = new p5.FFT();
  fft.setInput(mic);
  
    background(0);
}

function draw() {
  background(0);

  circspec(0, 300, 100,0.05);
  circspec(300, 600, 200,0.02);
  circspec(600, 800, 300,0.01);
  
  let sinval = abs(sin(frameCount*0.01))*700;
  
  linespec(int(sinval), 800, 300,0.1);
}

function circspec(startspec, endspec, rad, rota) {
  
  stroke(255);
  noFill();
  strokeWeight(1);
  
  let spectrum = fft.analyze();

  push();
  translate(width/2,height/2);
  rotate(frameCount*rota);
  translate(-width/2,-height/2);
  
  
  beginShape();
  for (i = startspec; i < endspec; i++) {
    let angle = map(i, startspec, endspec, 0, TWO_PI);
    vertex(
      width / 2 + sin(angle) * rad,
      width / 2 + cos(angle) * map(spectrum[i], 0, 255, rad, 0)
    );
  }
  endShape(CLOSE);
  
  pop();
}

function linespec(startspec, endspec, rad, rota) {
  
  stroke(255);
  noFill();
  strokeWeight(1);
  
  let spectrum = fft.analyze();

  push();
  translate(width/2,height/2);
  rotate(frameCount*rota);
  translate(-width/2,-height/2);
  
  
  beginShape();
  for (i = startspec; i < endspec; i+=3) {
    let angle = map(i, startspec, endspec, 0, TWO_PI);
    let angle2 = map(i, 0, 300, 0, TWO_PI);
    
    /*vertex(
      width / 2 + sin(angle) * rad,
      width / 2 + cos(angle) * map(spectrum[i], 0, 255, rad, 0)
    );*/
    
    line(width/2+sin(angle2)*100,height/2+ cos(angle2)*100, width / 2 + sin(angle) * rad, width / 2 + cos(angle) * map(spectrum[i], 0, 255, rad, 0));
    
  }
  endShape(CLOSE);
  
  pop();
}

