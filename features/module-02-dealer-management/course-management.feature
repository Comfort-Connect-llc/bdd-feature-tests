# Feature file generated from BRD User Stories
# Domain 18: Learning Management
# Section 18.1: Course Management

Feature: Course Management
  Learning Management

  @US-18-1-1 @domain-18
  Scenario: Create Training Course
    # As a Administrator, I want to create training courses
    # so that dealers can learn about products and processes
    Given training content
    When I create a course
    Then the course is available for enrollment
    And includes description, objectives, and duration

  @US-18-1-2 @domain-18
  Scenario: Organize Course into Lessons
    # As a Administrator, I want to organize courses into lessons and segments
    # so that content is structured logically
    Given a course exists
    When I add lessons and segments
    Then the course structure is defined
    And learners can progress through sequentially

  @US-18-1-3 @domain-18
  Scenario: Add Resources to Course
    # As a Administrator, I want to add resources (documents, videos) to courses
    # so that learners have reference materials
    Given a course or lesson
    When I add resources
    Then the resources are available to learners
    And can be downloaded or viewed
