Feature: Company presentation
  As a prospective client
  I want to quickly understand what God Object does and why they are credible
  So that I can decide whether to reach out about my software project

  Background:
    Given I have navigated to the God Object website

  @co-1
  Scenario: Visitor understands the company's core offering above the fold
    When I view the homepage without scrolling
    Then I see the God Object name and logo
    And I see a headline that conveys bespoke software development
    And I see a primary call-to-action to make contact

  @co-2
  Scenario: Visitor reads about the company's technical capabilities
    When I scroll to the services or about section
    Then I see a description of what kinds of software God Object builds
    And the language conveys deep technical expertise, not generic agency copy

  @co-3
  Scenario: Visitor sees Emello as proof of technical capability
    When I scroll to the products section
    Then I see Emello presented as a flagship product built by God Object
    And the description connects Emello's technical ambition to God Object's broader capability

  @co-4
  Scenario: Site renders correctly on mobile
    Given I am using a mobile device with a 390px wide viewport
    When I view the homepage
    Then all content is readable without horizontal scrolling
    And the navigation is usable on a small screen

  @co-5
  Scenario: Site loads fast enough not to lose a visitor
    When the homepage is loaded on a standard connection
    Then the largest contentful paint occurs within 2.5 seconds
    And the page is interactive within 3.5 seconds
