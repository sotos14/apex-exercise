@isTest
private class MovementHandlerTest
{
    @isTest
    static void moveToPosition_withDirectionCommand_shouldDelegateCommandToDirectionController()
    {
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        Domain.IDirectionController controllerMock = new Mocks.DirectionController(mocks);
        Domain.Position startingPosition = new Domain.Position();
        Domain.Command command = Domain.Command.ROTATE_LEFT;

        new MovementHandler(startingPosition, controllerMock, null).moveToPosition(command);

        ((Domain.IDirectionController)mocks.verify(controllerMock, 1)).rotate(startingPosition.Dir, command);
    }

    @isTest
    static void moveToPosition_withDirectionCommand_shouldUpdateDirection()
    {
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        Domain.IDirectionController controllerMock = new Mocks.DirectionController(mocks);
        Domain.Position startingPosition = new Domain.Position();
        Domain.Command command = Domain.Command.ROTATE_LEFT;

        mocks.startStubbing();
        mocks.when(controllerMock.rotate(startingPosition.Dir, command)).thenReturn(Domain.Direction.S);
        mocks.stopStubbing();

        Domain.Position resultedPosition = new MovementHandler(startingPosition, controllerMock, null).moveToPosition(command);

        System.assertEquals(Domain.Direction.S, resultedPosition.Dir, 'The direction has not been updated corectly');
    }

    @isTest
    static void moveToPosition_withMovementCommand_shouldDelegateCommandToPositionController()
    {
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        Domain.IPositionController controllerMock = new Mocks.PositionController(mocks);
        Domain.Position startingPosition = new Domain.Position();
        Domain.Command command = Domain.Command.MOVE;

        new MovementHandler(startingPosition, null, controllerMock).moveToPosition(command);

        ((Domain.IPositionController)mocks.verify(controllerMock, 1))
            .move(coordinatesOf(new Domain.Position().Coords), (Domain.Direction)fflib_Match.eq(startingPosition.Dir));
    }

    @isTest
    static void moveToPosition_withMovementCommand_shouldUpdateCoordinates()
    {
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        Domain.IPositionController controllerMock = new Mocks.PositionController(mocks);
        Domain.Position startingPosition = new Domain.Position();
        Domain.Command command = Domain.Command.MOVE;

        mocks.startStubbing();
        mocks.when(controllerMock.move(coordinatesOf(new Domain.Position().Coords), (Domain.Direction)fflib_Match.eq(startingPosition.Dir))).thenReturn(new Domain.Coordinates(0, 3));
        mocks.stopStubbing();

        Domain.Position resultedPosition = new MovementHandler(startingPosition, null, controllerMock).moveToPosition(command);

        System.assertEquals(0, resultedPosition.Coords.X, 'Coordinate X failed to update');
        System.assertEquals(3, resultedPosition.Coords.Y, 'Coordinate Y failed to update');
    }

    private static Domain.Coordinates coordinatesOf(Domain.Coordinates toMatch)
    {
        return (Domain.Coordinates)fflib_Match.matches(new CoordinatesMatcher(toMatch));
    }

    /**
     *  Custom matcher to be used in ApexMocks.
     *  It is required as Apex Mocks cannot compare two instances
     *  if they are not SObjects.
     */
    private class CoordinatesMatcher implements fflib_IMatcher
    {
        private Domain.Coordinates toMatch;

        public CoordinatesMatcher(Domain.Coordinates toMatch)
        {
            this.toMatch = toMatch;
        }

        public Boolean matches(Object arg)
        {
            if(arg != null && arg instanceof Domain.Coordinates)
            {
                Domain.Coordinates obj = (Domain.Coordinates)arg;
                return obj.X == toMatch.X && obj.Y == toMatch.Y;
            } 

            return false;
        }
    }
}