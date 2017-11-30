Apex Exercise
=============

The code is a solution to an Apex Exercise. It uses the Apex Mocks Framework for mocking support in unit tests as well.

## Deploy

To deploy the code in an org

- Create a ```local.build.properties``` file and specify the credentials (email for username, password and security token for the password field):
    - sf.username=yourusername
    - sf.password=yourpassword
- in the terminal at the root directory of the project run: ```ant deploy```

NOTE: You do not need to provide an API Security Token with your password if your IP Adress is whitelisted in the org. 
