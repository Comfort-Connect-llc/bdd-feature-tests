# Feature file generated from BRD User Stories
# Domain 18: Learning Management
# Section 18.2: Training Enrollment

Feature: Training Enrollment
  Learning Management

  @US-18-2-1 @domain-18
  Scenario: Enroll in Training Course
    # As a Dealer User, I want to enroll in training courses
    # so that I can learn about products and processes
    Given available courses
    When I enroll in a course
    Then I can access the course content
    And my progress is tracked

  @US-18-2-2 @domain-18
  Scenario: Complete Training Lesson
    # As a Dealer User, I want to complete lessons and mark them done
    # so that my progress is recorded
    Given I am enrolled in a course
    When I complete a lesson
    Then my completion is recorded
    And I can proceed to the next lesson

  @US-18-2-3 @domain-18
  Scenario: View Training Progress
    # As a Dealer User, I want to view my training progress
    # so that I know what I've completed
    Given I am enrolled in courses
    When I view my progress
    Then I see completed and remaining lessons
    And overall completion percentage
