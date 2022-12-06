Feature:

  Background:
    * url 'https://gorest.co.in/public/v2'
    * def access_token = 'cc7a8d5937c3ce14d7fb7446fcd6323d697aca733dd64195ee1849c39296a7af'

  Scenario: successfuly get all users
    Given path 'users'
    When method get

    Then status 200

  Scenario: successfuly get user by id
    Given path 'users/4182'
    When method get

    Then status 200
    And response.name = 'Devan Guneta'

  Scenario: unsuccessfuly get user by invalid id
    Given path 'users/a123'
    When method get

    Then status 404

  Scenario: successfuly create and delete user 
    Given path 'users'
    When request { name: 'Alvaro', gender: 'male', email: 'asda@asd.com', status: 'active' }
    And header Authorization = 'Bearer ' + access_token

    And method post
    Then status 201

    And def user_id = response.id
    And path 'users/' + user_id
    And header Authorization = 'Bearer ' + access_token

    When method delete
    Then status 204

  Scenario: successfuly create, update and delete user 
    Given path 'users'
    When request { name: 'Alvaro', gender: 'male', email: 'asda@asd.com', status: 'active' }
    And header Authorization = 'Bearer ' + access_token

    And method post
    Then status 201

    And def user_id = response.id

    And path 'users/' + user_id
    And header Authorization = 'Bearer ' + access_token
    And request { name: 'Alvaro2' }

    When method put
    Then status 200
    And response.name = 'Alvaro2'

    And path 'users/' + user_id
    And header Authorization = 'Bearer ' + access_token

    When method delete
    Then status 204


    




  
  
 