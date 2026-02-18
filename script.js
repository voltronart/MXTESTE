const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

let particles = [];
const maxParticles = window.innerWidth < 768 ? 80 : 150;
class Particle {
  constructor() {
    this.reset(true);
  }

  reset(initial = false) {
    this.x = Math.random() * canvas.width;
    this.y = Math.random() * canvas.height;

    // Tamanhos variados (mistura grande + pequeno)
    this.size = Math.random() * 3 + 0.5;

    // Velocidade bem suave
    this.speedX = Math.random() * 0.5 - 0.1;
    this.speedY = Math.random() * 0.4 - 0.1;

    // Opacidade começa baixa para efeito de surgir
    this.opacity = initial ? Math.random() : 0;

    // Vida longa
    this.fadeSpeed = Math.random() * 0.001 + 0.0005;

    // Controle de crescimento inicial
    this.growing = true;
  }

  update() {
    this.x += this.speedX;
    this.y += this.speedY;

    // Efeito aparecer suavemente
    if (this.growing) {
      this.opacity += 0.01;
      if (this.opacity >= 1) {
        this.opacity = 1;
        this.growing = false;
      }
    } else {
      this.opacity -= this.fadeSpeed;
      if (this.opacity <= 0) {
        this.reset();
      }
    }

    // Rebater nas bordas
    if (this.x > canvas.width || this.x < 0) this.speedX *= -1;
    if (this.y > canvas.height || this.y < 0) this.speedY *= -1;
  }

  draw() {
    ctx.beginPath();

    // Blur leve
    ctx.shadowBlur = 10;
    ctx.shadowColor = "rgba(0,0,0,0.5)";

    ctx.fillStyle = `rgba(0,0,0,${this.opacity})`;
    ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
    ctx.fill();

    ctx.shadowBlur = 0; // reset
  }
}

function init() {
  particles = [];
  for (let i = 0; i < maxParticles; i++) {
    particles.push(new Particle());
  }
}

function animate() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);

  particles.forEach(p => {
    p.update();
    p.draw();
  });

  requestAnimationFrame(animate);
}

init();
animate();

window.addEventListener("resize", () => {
  canvas.width = window.innerWidth;
  canvas.height = window.innerHeight;
  init();
});
const reveals = document.querySelectorAll(".reveal");

function revealOnScroll() {
  const windowHeight = window.innerHeight;

  reveals.forEach(element => {
    const elementTop = element.getBoundingClientRect().top;

    if (elementTop < windowHeight - 100) {
      element.classList.add("active");
    }
  });
}

window.addEventListener("scroll", revealOnScroll);
const modal = document.getElementById("aboutModal");
const openBtn = document.getElementById("openModal");
const closeBtn = document.getElementById("closeModal");
const parallax = document.querySelector(".parallax-bg");

const hamburger = document.getElementById("hamburger");
const menu = document.getElementById("menu");

hamburger.addEventListener("click", () => {
  menu.classList.toggle("active");
});


