Apex Exercise
=============

The code is a solution to an Apex Exercise. It uses the Apex Mocks Framework for mocking support in unit tests as well.

## Deploy

To deploy the code in an org

- Create a ```local.build.properties``` file at the root directory and specify the credentials (email for username, password and security token for the password field):
    - sf.username=your_username
    - sf.password=your_password_and_api_security_token
- in the terminal at the root directory of the project run: ```ant deploy```

NOTE: You do not need to provide an API Security Token with your password if your IP Adress is whitelisted in the org. 

## Execution

The entry point of the application is the Exercise.cls

You can execute a command by running the following in the AnnonymousApex Console
``` java
String resultedPosition = new Exercise().movePiece('MMMMM');
System.debug(resultedPosition);
```

