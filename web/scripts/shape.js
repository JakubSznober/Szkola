const canvas = document.getElementById('shapeCanvas');
const ctx = canvas.getContext('2d');

function drawSquare(x, y, size) {
    ctx.fillStyle = 'blue';
    ctx.fillRect(x, y, size, size);
}

function drawRectangle(x, y, width, height) {
    ctx.fillStyle = 'green';
    ctx.fillRect(x, y, width, height);
}

function drawTriangle(x, y, size) {
    ctx.fillStyle = 'red';
    ctx.beginPath();
    ctx.moveTo(x, y);
    ctx.lineTo(x + size, y);
    ctx.lineTo(x + size / 2, y - size);
    ctx.closePath();
    ctx.fill();
}

function drawCircle(x, y, radius) {
    ctx.fillStyle = 'yellow';
    ctx.beginPath();
    ctx.arc(x, y, radius, 0, Math.PI * 2);
    ctx.closePath();
    ctx.fill();
}

drawSquare(10, 10, 50);
drawRectangle(70, 10, 100, 50);
drawTriangle(200, 60, 50);
drawCircle(300, 35, 25);