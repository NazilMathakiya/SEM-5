//3.2 -  W.A.P. to create class Animal that has a method called animalSound() Subclass of Animals is cat it has its own
//implementation of an animal sound. (B)

import 'dart:io';

class Animal
{
  void animalSound()
  {
    print("animal Sound");
  }
}

class Cat extends Animal
{
  @override
  void animalSound()
  {
    print("cat Sound");
  }
}

void main()
{
  Animal a = Animal();
  a.animalSound();

  Cat c = Cat();
  c.animalSound();
}
//D:/SOFTWARE/FLUTTER/flutter/bin/cache/dart-sdk/bin/dart.exe --enable-asserts --no-serve-devtools "D:\DARSHAN UNIVERSITY\Semester - 5\Flutter android\lib\[flutter]lab_03\3.2.dart"
// animal Sound
// cat Sound