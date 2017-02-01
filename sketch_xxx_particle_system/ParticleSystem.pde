class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  color[] palette;
  ParticleSystem(PVector _origin, color[] _palette) {
    origin = _origin.copy();
    particles = new ArrayList<Particle>();
    palette = _palette;
  }
  
  void addParticle() {
    int n = (int)random(palette.length);
    particles.add(new Particle(origin, palette[n]));
  }
  
  void addParticle(float x, float y) {
    int n = (int)random(palette.length);
    particles.add(new Particle(new PVector(x, y), palette[n]));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}