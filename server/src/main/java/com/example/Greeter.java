package com.example;

/**
 * This is a class.
 */
public class Greeter {

  /**
   * This is a constructor.
   */
  public Greeter() {

  }

/**
  * @param someone name of the person
    @return greetings
  *
*/
  public final String greet(final String someone) {
    return String.format("Fuck you, %s!", someone);
  }
}
