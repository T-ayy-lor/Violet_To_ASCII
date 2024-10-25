import processing.video.*;
Movie violet;
String density = "$%#*+=-:.  ";

void setup() {
    size(650, 813);
    println("Setting up the movie...");
    violet = new Movie(this, "violet74x94.mp4");
    frameRate(30);
    violet.loop();
}

void draw() {
    background(0);
    violet.loadPixels();
    if (violet.available()) {
        violet.read();
    }
    float w = width / float(violet.width);
    float h = height / float(violet.height);
    for (int x = 0; x < violet.width; x++) {
        for (int y = 0; y < violet.height; y++) {
            int index = x + y * violet.width;
            float r = red(violet.pixels[index]);
            float g = green(violet.pixels[index]);
            float b = blue(violet.pixels[index]);
            float avg = (r + g + b) / 3;
            
            int len = density.length();
            int charIndex = floor(map(avg, 0, 255, len - 1, 0));

            noStroke();
            textSize(min(w, h) * 2);
            textAlign(CENTER, CENTER);
            float xPos = x * w + w / 2;
            float yPos = y * h + h / 2;
            text(density.charAt(charIndex), xPos, yPos);
        }
    }
}


