#include <Servo.h>

Servo ESC;     // create servo object to control the ESC
int potValue;  // value from the serial input
int potValueScaled;
const int buttonPin = 3;  // Button connected to pin 3 (corrected comment)

void setup() {
  pinMode(buttonPin, INPUT_PULLUP);  // Enable internal pull-up resistor
  ESC.attach(5, 1000, 2000);         // ESC on pin 5
  Serial.begin(9600);
  delay(5000);  // Wait for ESC to arm (if required)
  Serial.println("Ready! Enter 0 or 1 in Serial.");
}

void loop() {
  // Check serial input
  if (Serial.available() > 0) {
    char input = Serial.read();

    if (input == '1') {
      potValue = 1;
      potValueScaled = 180;
    } else if (input == '0') {
      potValue = 0;
      potValueScaled = 0;
    }
  }

  // ESC control
  ESC.write(potValueScaled);

  // Feedback
  Serial.print(" Pot: ");
  Serial.print(potValue);
  Serial.print("  ESC write: ");
  Serial.println(potValueScaled);

  delay(200);
}

