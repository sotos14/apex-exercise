@isTest
private class PositionControllerTest 
{
    @isTest
    static void move_withDirectionNorth_shouldReturnCorrectCoordinates()
    {
        Domain.Coordinates currentCoords = new Domain.Coordinates(0, 0);

        Domain.Coordinates resultedCoords = new PositionController(2).move(currentCoords, Domain.Direction.N);

        System.assertEquals(0, resultedCoords.X, 'Wrong X coordinate when moving North');
        System.assertEquals(1, resultedCoords.Y, 'Wrong Y coordinate when moving North');
    }

    @isTest
    static void move_withDirectionEast_shouldReturnCorrectCoordinates()
    {
        Domain.Coordinates currentCoords = new Domain.Coordinates(0, 0);

        Domain.Coordinates resultedCoords = new PositionController(2).move(currentCoords, Domain.Direction.E);

        System.assertEquals(1, resultedCoords.X, 'Wrong X coordinate when moving East');
        System.assertEquals(0, resultedCoords.Y, 'Wrong Y coordinate when moving East');
    }

    @isTest
    static void move_withDirectionSouth_shouldReturnCorrectCoordinates()
    {
        Domain.Coordinates currentCoords = new Domain.Coordinates(1, 1);

        Domain.Coordinates resultedCoords = new PositionController(2).move(currentCoords, Domain.Direction.S);

        System.assertEquals(1, resultedCoords.X, 'Wrong X coordinate when moving South');
        System.assertEquals(0, resultedCoords.Y, 'Wrong Y coordinate when moving South');
    }

    @isTest
    static void move_withDirectionWest_shouldReturnCorrectCoordinates()
    {
        Domain.Coordinates currentCoords = new Domain.Coordinates(1, 1);

        Domain.Coordinates resultedCoords = new PositionController(2).move(currentCoords, Domain.Direction.W);

        System.assertEquals(0, resultedCoords.X, 'Wrong X coordinate when moving West');
        System.assertEquals(1, resultedCoords.Y, 'Wrong Y coordinate when moving West');
    }

    @isTest
    static void move_atBorderWithDirectionNorth_shouldNotChangeCoordinates()
    {
        Domain.Coordinates currentCoords = new Domain.Coordinates(0, 0);

        Domain.Coordinates resultedCoords = new PositionController(1).move(currentCoords, Domain.Direction.N);

        System.assertEquals(0, resultedCoords.X, 'Wrong X coordinate.');
        System.assertEquals(0, resultedCoords.Y, 'Wrong Y coordinate.');
    }

    @isTest
    static void move_atBorderwithDirectionEast_shouldNotChangeCoordinates()
    {
        Domain.Coordinates currentCoords = new Domain.Coordinates(0, 0);

        Domain.Coordinates resultedCoords = new PositionController(1).move(currentCoords, Domain.Direction.E);

        System.assertEquals(0, resultedCoords.X, 'Wrong X coordinate.');
        System.assertEquals(0, resultedCoords.Y, 'Wrong Y coordinate.');
    }

    @isTest
    static void move_atBorderwithDirectionSouth_shouldNotChangeCoordinates()
    {
        Domain.Coordinates currentCoords = new Domain.Coordinates(0, 0);

        Domain.Coordinates resultedCoords = new PositionController(1).move(currentCoords, Domain.Direction.S);

        System.assertEquals(0, resultedCoords.X, 'Wrong X coordinate.');
        System.assertEquals(0, resultedCoords.Y, 'Wrong Y coordinate.');
    }

    @isTest
    static void move_atBorderwithDirectionWest_shouldNotChangeCoordinates()
    {
        Domain.Coordinates currentCoords = new Domain.Coordinates(0, 0);

        Domain.Coordinates resultedCoords = new PositionController(1).move(currentCoords, Domain.Direction.W);

        System.assertEquals(0, resultedCoords.X, 'Wrong X coordinate.');
        System.assertEquals(0, resultedCoords.Y, 'Wrong Y coordinate.');
    }
}