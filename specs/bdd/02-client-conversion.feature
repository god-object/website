Feature: Client conversion
  As a prospective client
  I want to be able to make contact with God Object easily
  So that I can start a conversation about my project

  Background:
    Given I have navigated to the God Object website

  @cl-1
  Scenario: Visitor submits a contact enquiry
    Given I have scrolled to or navigated to the contact section
    When I fill in my name, email address, and a message describing my project
    And I submit the form
    Then I see a confirmation that my message has been received
    And God Object receives an email notification with my enquiry details

  @cl-2
  Scenario: Visitor submits the form with missing required fields
    Given I am viewing the contact form
    When I submit the form without filling in a required field
    Then I see an inline validation error identifying the missing field
    And the form is not submitted

  @cl-3
  Scenario: Visitor submits the form with an invalid email address
    Given I am viewing the contact form
    When I enter a malformed email address and submit
    Then I see a validation error indicating the email is invalid
    And the form is not submitted

  @cl-4
  Scenario: Contact call-to-action is reachable from the hero
    When I view the homepage hero section
    Then there is a visible link or button that takes me directly to the contact form
    And the scroll or navigation is smooth
