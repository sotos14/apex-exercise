@isTest
private class DirectionControllerTest
{
    @isTest
    static void rotateRight_withCurrentDirectionNorth_shouldReturnDirectionEast()
    {
        Domain.Command com = Domain.Command.ROTATE_RIGHT;

        Domain.Direction currentDirection = Domain.Direction.N;
        Domain.Direction resultedDirection = new DirectionController().rotate(currentDirection, com);

        System.assertEquals(Domain.Direction.E, resultedDirection, 'Wrong direction when from North we rotate right');
    }

    @isTest
    static void rotateRight_withCurrentDirectionEast_shouldReturnDirectionSouth()
    {
        Domain.Command com = Domain.Command.ROTATE_RIGHT;

        Domain.Direction currentDirection = Domain.Direction.E;
        Domain.Direction resultedDirection = new DirectionController().rotate(currentDirection, com);

        System.assertEquals(Domain.Direction.S, resultedDirection, 'Wrong direction when from East we rotate Right');
    }

    @isTest
    static void rotateRight_withCurrentDirectionSouth_shouldReturnDirectionWest()
    {
        Domain.Command com = Domain.Command.ROTATE_RIGHT;

        Domain.Direction currentDirection = Domain.Direction.S;
        Domain.Direction resultedDirection = new DirectionController().rotate(currentDirection, com);

        System.assertEquals(Domain.Direction.W, resultedDirection, 'Wrong direction when from South we rotate Right');
    }

    @isTest
    static void rotateRight_withCurrentDirectionWest_shouldReturnDirectionNorth()
    {
        Domain.Command com = Domain.Command.ROTATE_RIGHT;

        Domain.Direction currentDirection = Domain.Direction.W;
        Domain.Direction resultedDirection = new DirectionController().rotate(currentDirection, com);

        System.assertEquals(Domain.Direction.N, resultedDirection, 'Wrong direction when from West we rotate Right');
    }

    @isTest
    static void rotateLeft_withCurrentDirectionNorth_shouldReturnDirectionWest()
    {
        Domain.Command com = Domain.Command.ROTATE_LEFT;

        Domain.Direction currentDirection = Domain.Direction.N;
        Domain.Direction resultedDirection = new DirectionController().rotate(currentDirection, com);

        System.assertEquals(Domain.Direction.W, resultedDirection, 'Wrong direction when from North we rotate Left');
    }

    @isTest
    static void rotateLeft_withCurrentDirectionWest_shouldReturnDirectionSouth()
    {
        Domain.Command com = Domain.Command.ROTATE_LEFT;

        Domain.Direction currentDirection = Domain.Direction.W;
        Domain.Direction resultedDirection = new DirectionController().rotate(currentDirection, com);

        System.assertEquals(Domain.Direction.S, resultedDirection, 'Wrong direction when from East we rotate Left');
    }

    @isTest
    static void rotateLeft_withCurrentDirectionSouth_shouldReturnDirectionEast()
    {
        Domain.Command com = Domain.Command.ROTATE_LEFT;

        Domain.Direction currentDirection = Domain.Direction.S;
        Domain.Direction resultedDirection = new DirectionController().rotate(currentDirection, com);

        System.assertEquals(Domain.Direction.E, resultedDirection, 'Wrong direction when from South we rotate Left');
    }

    @isTest
    static void rotateLeft_withCurrentDirectionEast_shouldReturnDirectionNorth()
    {
        Domain.Command com = Domain.Command.ROTATE_LEFT;

        Domain.Direction currentDirection = Domain.Direction.E;
        Domain.Direction resultedDirection = new DirectionController().rotate(currentDirection, com);

        System.assertEquals(Domain.Direction.N, resultedDirection, 'Wrong direction when from West we rotate Left');
    }
}