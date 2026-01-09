Feature: Cambiar contraseña 

Background:
    * url urlBase
    * def contrasenaActual = read('classpath:resources/functional/request/Auth/requestDirectivo.json').Contraseña
    * def result = call read('classpath:resources/features/Login/POST-LoginRolDirectivo.feature@tokenDirectivo') 
    * def directivoToken = result.token

    @probando
Scenario: Validar que el servicio de cambiar mi contraseña por el rol Directivo responde correctamente
    Given path "/api/mis-datos/mi-contrasena"
    And header Authorization = 'Bearer ' + directivoToken
    And request 
    """
    {
      "contrasenaActual": contrasenaActual,
      "nuevaContrasena": "Directivo456$"
    }
    """
    When method PUT
    Then status 200