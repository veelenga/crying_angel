window.addEventListener("load", windowLoadHandler, false);

function windowLoadHandler() {
  canvasApp();
}

function canvasApp() {
  var theCanvas = document.getElementById("city_of_angels");
  var context = theCanvas.getContext("2d");
  var background = new Image();
  var totalDistance = document.getElementById("total_distance");
  var angelState = document.getElementById("angel_state");

  init();

  var shapes;
  var dragIndex;
  var dragging;
  var mouseX;
  var mouseY;
  var dragHoldX;
  var dragHoldY;

  var angelView;
  var startCryDistance;
  var scale;

  var angel;
  var ivanko;
  var olenka;

  function init() {
    shapes = [];
    angelView = 500;
    scale = 0.5;
    startCryDistance = 300;

    angel = makeAngel("Angel", 10, "#FFFF00", angelView * scale);
    ivanko = makeHuman("Ivanko", 10, "#64FE2E");
    olenka = makeHuman("Olenka", 10, "#DF013A");

    shapes.push(angel);
    shapes.push(ivanko);
    shapes.push(olenka);

    drawScreen();

    theCanvas.addEventListener("mousedown", mouseDownListener, false);
  }

  function makeShape(name, size, color) {
    var tempX = Math.random() * (theCanvas.width - size);
    var tempY = Math.random() * (theCanvas.height - size);
    var tempShape = {x:tempX, y:tempY, rad:size, color:color, name:name};
    shapes.push(tempShape);
  }

  function getRandCoordinates(size){
    var tempX = Math.random() * (theCanvas.width - size);
    var tempY = Math.random() * (theCanvas.height - size);
    return [tempX, tempY];
  }

  function makeHuman(name, size, color) {
    var coordinates = getRandCoordinates(size);
    return {x:coordinates[0], y:coordinates[1], rad:size, color:color, name:name};
  }

  function makeAngel(name, size, color, view) {
    var angel = makeHuman(name, size, color);
    angel.view = view;
    return angel;
  }

  function mouseDownListener(evt) {
    var i;
    var highestIndex = -1;

    var bRect = theCanvas.getBoundingClientRect();
    mouseX = (evt.clientX - bRect.left) * (theCanvas.width / bRect.width);
    mouseY = (evt.clientY - bRect.top) * (theCanvas.height / bRect.height);

    // find which shape was clicked
    for (i = 0; i < shapes.length; i++) {
      if(hitTest(shapes[i], mouseX, mouseY)) {
        dragging = true;
        if (i > highestIndex) {
          dragHoldX = mouseX - shapes[i].x;
          dragHoldY = mouseY - shapes[i].y;
          highestIndex = i;
          dragIndex = i;
        }
      }
    }

    if (dragging) {
      window.addEventListener("mousemove", mouseMoveListener, false);
    }
    theCanvas.removeEventListener("mousedown", mouseDownListener, false);
    window.addEventListener("mouseup", mouseUpListener, false);

    // this prevents the mouse down from having an effect on the main browser window
    if (evt.preventDefault) {
      evt.preventDefault();
    } //standard
    else if (evt.returnValue) {
      evt.returnValue = false;
    } //older IE
    return false;
  }

  function mouseUpListener(evt) {
    theCanvas.addEventListener("mousedown", mouseDownListener, false);
    window.removeEventListener("mouseup", mouseUpListener, false);
    if (dragging) {
      dragging = false;
      window.removeEventListener("mousemove", mouseMoveListener, false);
    }
  }

  function mouseMoveListener(evt) {
    var posX;
    var posY;
    var shapeRad = shapes[dragIndex].rad;
    var minX = 0;
    var maxX = theCanvas.width;
    var minY = 0;
    var maxY = theCanvas.height;

    var bRect = theCanvas.getBoundingClientRect();
    mouseX = (evt.clientX - bRect.left) * (theCanvas.width / bRect.width);
    mouseY = (evt.clientY - bRect.top) * (theCanvas.height / bRect.height);

    //clamp x and y positions to prevent object from dragging outside of canvas
    posX = mouseX - dragHoldX;
    posX = (posX < minX) ? minX : ((posX > maxX) ? maxX : posX);
    posY = mouseY - dragHoldY;
    posY = (posY < minY) ? minY : ((posY > maxY) ? maxY : posY);

    shapes[dragIndex].x = posX;
    shapes[dragIndex].y = posY;

    drawScreen();
  }

  function hitTest(shape, mx, my) {
    var dx = mx - shape.x;
    var dy = my - shape.y;

    return (dx * dx + dy * dy < shape.rad * shape.rad);
  }

  function getDistance(shape1, shape2) {
    var d = Math.sqrt(Math.pow(shape1.x - shape2.x, 2) + Math.pow(shape1.y - shape2.y, 2));
    return (d / scale).toFixed(2);
  }

  function isAngelCrying(curDistance, olenka, ivanko, angel){
    var d1 = getDistance(angel, olenka);
    var d2 = getDistance(angel, ivanko);
    var presumablyDistance = angelView - startCryDistance

    if (d1 > angelView) { // angel does not know where is olenka
      if (d2 < presumablyDistance) {
        return true;
      } else {
        return false;
      }
    }

    if (d2 > angelView) { // angel does not know where is ivanko
      if (d1 < presumablyDistance) {
        return true;
      } else {
        return false;
      }
    }

    // angel can see both
    return curDistance > startCryDistance;
  }

  function drawPersons() {
    drawAngel(angel);
    drawHuman(olenka);
    drawHuman(ivanko);
  }

  function drawStats() {
    var curDistance = getDistance(ivanko, olenka);
    totalDistance.textContent = curDistance;

    var s = "Angel isn't crying currently";
    if (isAngelCrying(curDistance, ivanko, olenka, angel)) {
      s = "Angel is crying now";
    }
    angelState.textContent = s;
  }

  function drawHuman(human){
    context.fillStyle = human.color;
    context.beginPath();
    context.arc(human.x, human.y, human.rad, 0, 2 * Math.PI, true);
    context.closePath();
    context.fill();

    context.textAlign = 'center';
    context.font = 'italic 10pt Calibri';
    context.fillText(human.name,
      human.x, human.y + human.rad + 20);
  }

  function drawAngel(angel) {
    drawHuman(angel);
    context.beginPath();
    context.arc(angel.x, angel.y, angel.view, 0, 2 * Math.PI, true);
    context.closePath();
    context.lineWidth = 1;
    context.strokeStyle = angel.color;
    context.stroke();
  }

  function drawScreen() {
    background.src = "images/city_of_angels.png";

    // make sure the image is loaded first otherwise nothing will draw.
    background.onload = function(){
      context.drawImage(background, 0, 0);
      drawPersons();
      drawStats();
    }
  }
}

