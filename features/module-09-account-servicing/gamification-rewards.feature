# Feature file for Gamification and Rewards
# Module 9: Account Servicing
# Section: Worry-Free Rewards and Gamification
# Priority: MEDIUM - Expansion of existing US-9.4.1

Feature: Gamification and Rewards
  Dealer and customer rewards programs with gamification elements

  Background:
    Given the Comfort Connect rewards system is available

  @US-9-4-1 @module-09 @rewards @worry-free
  Scenario: Enroll in Worry-Free Rewards Program
    # As a Homeowner, I want to enroll in the Worry-Free Rewards program
    # so that I can earn benefits for on-time payments
    Given I have an active Premier account
    And I have made at least 3 consecutive on-time payments
    When I enroll in Worry-Free Rewards
    Then my enrollment is confirmed
    And I begin earning rewards based on payment history
    And I see my current reward tier status

  @US-9-4-2 @module-09 @rewards @tiers
  Scenario: Progress Through Reward Tiers
    # As a Homeowner, I want to progress through reward tiers
    # so that I earn increasing benefits
    Given I am enrolled in Worry-Free Rewards
    When I achieve payment milestones:
      | Consecutive Payments | Tier        | Benefit                    |
      | 12                   | Bronze      | Maintenance discount 5%    |
      | 24                   | Silver      | Maintenance discount 10%   |
      | 36                   | Gold        | Maintenance discount 15%   |
      | 48                   | Platinum    | Free annual maintenance    |
    Then my tier is automatically updated
    And I am notified of tier advancement
    And I can access tier-specific benefits

  @US-9-4-3 @module-09 @rewards @redemption
  Scenario: Redeem Rewards Benefits
    # As a Homeowner, I want to redeem my reward benefits
    # so that I receive the value I've earned
    Given I have earned rewards in Worry-Free Rewards
    When I request a maintenance service
    Then my reward discount is automatically applied
    And I see the savings on my service invoice

  @US-9-5-1 @module-09 @gamification @dealer @leaderboard
  Scenario: View Dealer Performance Leaderboard
    # As a Dealer, I want to view the performance leaderboard
    # so that I can see how I compare to other dealers
    Given I am a registered dealer
    And the gamification system tracks my performance
    When I view the leaderboard
    Then I see my ranking among dealers
    And I see performance metrics:
      | Metric                | My Value    | Top Performer |
      | Applications Submitted| 45          | 120           |
      | Approval Rate         | 78%         | 92%           |
      | Funded Volume         | $350,000    | $1,200,000    |
      | Customer Satisfaction | 4.5/5       | 4.9/5         |

  @US-9-5-2 @module-09 @gamification @dealer @achievements
  Scenario: Earn Dealer Achievements
    # As a Dealer, I want to earn achievements for milestones
    # so that I am recognized for my performance
    Given I am an active dealer
    When I reach performance milestones:
      | Achievement           | Requirement                    |
      | First Deal            | Complete first funded deal     |
      | Volume Champion       | Fund $500,000 in a month       |
      | Perfect Quarter       | 100% approval rate for quarter |
      | Customer Favorite     | 5-star average rating          |
    Then I earn achievement badges
    And my achievements are displayed on my profile
    And I may receive promotional benefits

  @US-9-5-3 @module-09 @gamification @dealer @incentives
  Scenario: Qualify for Performance Incentives
    # As a Dealer, I want to qualify for performance-based incentives
    # so that I am rewarded for exceeding targets
    Given I am participating in a quarterly incentive program
    When I achieve the incentive targets:
      | Target                | Requirement       | Incentive          |
      | Bronze Target         | 20 funded deals   | $500 bonus         |
      | Silver Target         | 40 funded deals   | $1,500 bonus       |
      | Gold Target           | 60 funded deals   | $3,000 bonus       |
      | Trip Qualifier        | 100 funded deals  | Vacation package   |
    Then I receive the corresponding incentive
    And my achievement is recognized in the leaderboard
