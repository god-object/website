Feature: Emello waitlist
  As a privacy-conscious home user
  I want to learn about Emello and register my interest
  So that I am notified when it becomes available

  Background:
    Given I have navigated to the God Object website

  @em-1
  Scenario: Visitor understands Emello's value proposition
    When I scroll to the Emello section
    Then I see the Emello name and a concise description of what it does
    And the description communicates self-hosted, AI-native, and privacy-preserving
    And I understand it is not yet available but is coming

  @em-2
  Scenario: Visitor joins the Emello waitlist
    Given I am viewing the Emello section
    When I enter my email address and submit the waitlist form
    Then I see a confirmation that I have been added to the waitlist
    And my email address is recorded for future notification

  @em-3
  Scenario: Visitor attempts to join waitlist with invalid email
    Given I am viewing the Emello waitlist form
    When I enter a malformed email address and submit
    Then I see a validation error indicating the email is invalid
    And the submission is not recorded

  @em-4
  Scenario: Visitor cannot sign up twice with the same email
    Given I have already joined the waitlist with my email address
    When I submit the waitlist form again with the same email
    Then I see a message indicating I am already on the waitlist
    And no duplicate record is created
