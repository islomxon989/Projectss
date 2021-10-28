/** 
* File: main.cpp
* Author1: Islam Azamov 
* Date: 12/10/2020 
* Course: CSE_321
* Inputs: Ultra Sonic Transducer and Onboard button to reset watchdog 
* Outputs: LED and a Buzzer 
* Constraints: The system can't detect water or wells. Also, it's not weatherproof

* Summary of File: The purpose of this file is to build a system that would
alert visually impaired individuals when they approach an obstacle/barrier. 

* Citations: 

* Reference 1: https://os.mbed.com/docs/mbed-os/v6.5/apis/pwmout.html
* Reference 2: https://os.mbed.com/docs/mbed-os/v6.5/apis/digitalin.html
* Reference 3: https://os.mbed.com/docs/mbed-os/v6.5/apis/digitalout.html

**/


#include "mbed.h"

// Defining timeout for watchdog 
#define Timeout 15000 

// Trigger PIN
DigitalOut trig(D7);

// Echo PIN
DigitalIn echo(D6);

// I/O PIN for the buzzer
PwmOut alert(PE_11);

// using onboard button
InterruptIn button(BUTTON1); // scheduling with interrupt 

// Timer to calculate time elapsed when echo is high 
Timer timeC;

// Creating thread for the watchdog 
Thread t; 

// Creating queue
EventQueue e1(32*EVENTS_EVENT_SIZE); 

//creating watchdog
Watchdog &TimerDog = Watchdog::get_instance(); 

// Prototyping
unsigned long long UltraSonic(void);

// Prototyping 
void WatchdogReset(); 
 
int main(void)
{
    // starting timeout
    TimerDog.start(Timeout); 

    printf("----------Start---------\n");

    // starting thread
    t.start(callback(&e1, &EventQueue::dispatch_forever)); // synchronization

    // triggering the button. The button triggers the function WatchdogReset when it's pressed.
    button.rise(e1.event(WatchdogReset)); 

    // enabling port C
    RCC->AHB2ENR |= 0x4; 
    
    // Configuring pins: PC_8 PC_9 PC_10 PC_11 as Outputs
    GPIOC->MODER &= ~(0xAA0000); 
    GPIOC->MODER |= 0x550000;

    // triggering output to LOW at the start of the programm
    trig = 0;

    // turning the buzer off at the start of the program
    alert.suspend();
    
 
    // The UltraSonic function will be used to print Distance
    while(1)
    {
        // Wait for 1 microsecond 
        wait_us(1);

        // Prints distance between the UltraSonic and the barrier/wall
        printf("Distance: %llu\n", UltraSonic());

        // IF the distance is less than 50cm
        if(UltraSonic()<=50){

            // turning the buzzer on 
            alert.resume();

            // Providing power to PC_10 || turning the LED on 
            GPIOC->ODR = 0x400; 
            
        }

        // IF the distance is greater than 50cm 
        else if(UltraSonic()>=50){

            // turning the LED off 
            GPIOC->ODR = ~(0x400); 
            
            // turning the buzzer off 
            alert.suspend();
        }   
    }
    return 0; // to avoid memory leak 
}


// Function will return distance between the ultra sonic and the barrier/wall in centimeters 
unsigned long long UltraSonic(void)
{

    //variable to hold distance
    unsigned long long distance;
    
    // supplying a short 10uS pulse to the trig to start the ranging
    trig.write(1); // HIGH
    wait_us(10); // Wait for 10 us 
    trig.write(0); // LOW 

    // While echo is LOW
    while(echo.read() == 0) {}
    
    // Reset the timer, then start it
    timeC.reset();
    timeC.start();

    // When echo is HIGH
    while(echo.read() == 1) {}

    // Stop the timer
    timeC.stop();

    // Calculate the distance 
    distance = timeC.elapsed_time().count();
    distance = distance * 0.03432 / 2.0;  // 0.03432 is the speed of sound 
    
    // returns distance 
    return distance;
    
}
 
// Resets the watchdog 
void WatchdogReset(){
    TimerDog.kick();
}
 

