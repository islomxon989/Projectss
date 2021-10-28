/** 
* File: CSE_321_project2_islamcha
* Author1: Islam Azamov 
* Author2: 
* Date: 09/26/2020
* Partner: 
* Course: CSE_321
* Input: 4 buttons(digit code/code entered via matrix keypad)
* Output: LED (everytime a value is entered, an LED lights up)
* Constraints: 

* Summary of File: Code for a security system that locks or unlocks based on a 4 digit person code
**/


#include "mbed.h" 
#include "1802.h"



CSE321_LCD lcd(16,2,LCD_5x8DOTS, PB_9, PB_8); //enabling LCD


static int cnt = 0; //To keep track of 4 digit code

int row = 0; //To keep track of rows

void isrUnlocked(); //function declarations for isrUnlocked
void isrReset(); //function declarations for Reset 
void firstButton2(); //function declarations 
void secondButton9(); //function declarations
void thirdButton8(); //function declarations
void fourthButton6(); //function declarations
 
Thread one; // Creating a thread one
Thread two; // Creating a thread two 
Thread three; // Creating a thread three
Thread four; // Creating a thread four 
Thread t; // Creating a thread t

EventQueue e1(32*EVENTS_EVENT_SIZE); //Creating EventQueue

InterruptIn trigger1(PE_5, PullDown); // Interrupt that triggers input PE_5 row 1 
InterruptIn trigger2(PE_2, PullDown); // Interrupt that triggers input PE_2 row 1 
InterruptIn trigger3(PE_3, PullDown); // Interrupt that triggers input PE_3 row 1 
InterruptIn trigger4(PE_4, PullDown); // Interrupt that triggers input PE_4 row 1 
InterruptIn reset(BUTTON1); //Interrupt that triggers Onboard button to reset all the numbers 

int main()
{
    one.start(callback(&e1, &EventQueue::dispatch_forever)); //linking the thread one and EventQueue
    trigger1.rise(e1.event(firstButton2)); //Third Column Buttons

    two.start(callback(&e1, &EventQueue::dispatch_forever)); //linking the thread two and EventQueue
    trigger2.rise(e1.event(secondButton9)); //Third Column Buttons

    three.start(callback(&e1, &EventQueue::dispatch_forever)); //linking the thread three and EventQueue
    trigger3.rise(e1.event(thirdButton8)); //First Column Buttons

    four.start(callback(&e1, &EventQueue::dispatch_forever)); //linking the thread four and EventQueue
    trigger4.rise(e1.event(fourthButton6)); //Second Column Buttons


    reset.rise(e1.event(isrReset)); //Onboard Button 1

    RCC->AHB2ENR |= 0x4; //port C
    RCC->AHB2ENR |=0x10; //portE
    GPIOC->MODER &= ~(0xAA0000); //Outputs PC_8_9_10_11
    GPIOC->MODER |= 0x550000;

    GPIOE->MODER &= ~(0xFF0); //inputs PE_2_3_4_5

  
    while (true){
        if(row == 0){
            GPIOC->ODR = 0x800; //providing power to row 1 (output PC_11)
        }
        else if(row == 1){
            GPIOC->ODR = 0x100; //provideing power to row 3 (output PC_8)
        }
        else if(row == 3){
            GPIOC->ODR = 0x400; //providing power to row 2 (output PC_10)
        }
    }
    
}

void firstButton2(){ //This ISR increases count and provides power to the next row where the next code is located. 
    if(cnt < 1){
        cnt++; //keeping track of # code entered
        row++; //keeping track of row
        GPIOC->ODR = 0x100; //providing power to the next row 
    }
}

void secondButton9(){ //This ISR increases count and provides power to the next row where the next code is located.
    if(cnt == 1){  
        cnt++; //keeping track of # code entered
        row++; //keeping track of row
        GPIOC->ODR = 0x100; //providing power to the next row 
    }
}

void thirdButton8(){  //This ISR increases count and provides power to the next row where the next code is located.
    if(cnt == 2){
        cnt++; //keeping track of # code entered
        row++; //keeping track of row
        GPIOC->ODR = 0x400; //providing power to the next row 
    }
}

void fourthButton6(){
    if(cnt == 3){ //When all codes are entered, the lcd prints. 
        lcd.begin(); //turn on the LCD
        lcd.print("Unlocked"); //print Unlocked 
        t.start(callback(&e1, &EventQueue::dispatch_forever));
    }
}




void isrReset(){ //This function resets all the numbers and locks the system.
    lcd.begin(); //LCD on 
    cnt = 0; // reset is zero again
    row =0; // row is zero again 
    GPIOC->ODR = 0x800; // power goes to first row again 
    lcd.clear(); //clears lcd
    lcd.print("Locked");  //prints Locked 
}



    