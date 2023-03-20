class Particle {
  constructor(x, y) {
    this.position = createVector(x, y);
     
    this.speed = random(2);
    this.velocity = createVector(random(-this.speed, this.speed), random(-this.speed, this.speed));
    
    this.decay = random(1,5);
    
    this.size = random(5, 20);
    this.alpha = 255;
  }

  update() {
    this.position.add(this.velocity);
    this.alpha -=  this.decay ;
  }

  display() {
    fill(255);
    noStroke();
    ellipse(this.position.x, this.position.y, 3);
  }

  isDead() {
    return this.alpha <= 0;
  }
}

class ParticleSystem {
  constructor() {
    this.particles = [];
  }

  addParticle(x, y) {
    this.particles.push(new Particle(x, y));
  }

  update() {
    for (let i = this.particles.length - 1; i >= 0; i--) {
      this.particles[i].update();
      if (this.particles[i].isDead()) {
        this.particles.splice(i, 1);
      }
    }
  }

  display() {
    for (const particle of this.particles) {
      particle.display();
    }
  }
}