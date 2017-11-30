@isTest
private class ExerciseTest
{
    @isTest
    static void movePiece_withRCommand_shouldDirectionEast()
    {
        String position = new Exercise().movePiece('R');

        System.assertEquals('0 0 E', position, 'Wrong Direction on returned position');
    }

    @isTest
    static void movePiece_withLCommand_shouldReturnDirectionWest()
    {
        String position = new Exercise().movePiece('L');

        System.assertEquals('0 0 W', position, 'Wrong Direction on returned position');
    }

    @isTest
    static void movePiece_withTwoRCommands_shouldReturnDirectionSouth()
    {
        String position = new Exercise().movePiece('LL');

        System.assertEquals('0 0 S', position, 'Wrong Direction on returned position');
    }

    @isTest
    static void movePiece_withTwoLCommands_shouldReturnDirectionSouth()
    {
        String position = new Exercise().movePiece('LL');

        System.assertEquals('0 0 S', position, 'Wrong Direction on returned position');
    }

    @isTest
    static void movePiece_withThreeRCommands_shouldReturnDirectionWest()
    {
        String position = new Exercise().movePiece('RRR');

        System.assertEquals('0 0 W', position, 'Wrong Direction on returned position');
    }

    @isTest
    static void movePiece_withThreeLCommands_shouldReturnDirectionEast()
    {
        String position = new Exercise().movePiece('LLL');

        System.assertEquals('0 0 E', position, 'Wrong Direction on returned position');
    }

    @isTest
    static void movePiece_withFourRCommands_shouldReturnDirectionNorth()
    {
        String position = new Exercise().movePiece('RRRR');

        System.assertEquals('0 0 N', position, 'Wrong Direction on returned position');
    }

    @isTest
    static void movePiece_withFourLCommands_shouldReturnDirectionNorth()
    {
        String position = new Exercise().movePiece('LLLL');

        System.assertEquals('0 0 N', position, 'Wrong Direction on returned position');
    }

    @isTest
    static void movePiece_withMultipleRCommands_shouldReturnCorrectDirection()
    {
        String position = new Exercise().movePiece('RRRRRRR');

        System.assertEquals('0 0 W', position, 'Wrong Direction on returned position');
    }

    @isTest
    static void movePiece_withMultipleLCommands_shouldReturnCorrectDirection()
    {
        String position = new Exercise().movePiece('LLLLLL');

        System.assertEquals('0 0 S', position, 'Wrong Direction on returned position');
    }

    @isTest
    static void movePiece_withMixedCommands_shouldReturnCorrectDirection()
    {
        String position = new Exercise().movePiece('LLRLLRRRLLR');

        System.assertEquals('0 0 W', position, 'Wrong Direction on returned position');
    }

    @isTest
    static void movePiece_WithSingleMoveCommand_shouldReturnPosition01()
    {
        String position = new Exercise().movePiece('M');

        System.assertEquals('0 1 N', position, 'Wrong position returned');
    }

    @isTest
    static void movePiece_WithMoreMoveCommandsNorthThanBoardSize_shouldStopAtBoardNorthBorder()
    {
        String position = new Exercise().movePiece('MMMMM');

        System.assertEquals('0 4 N', position, 'Wrong position returned');
    }

    @isTest
    static void movePiece_WithMoveCommandWest_shouldOnlyChangeOrientation()
    {
        String position = new Exercise().movePiece('LM');

        System.assertEquals('0 0 W', position, 'Wrong position returned');
    }

    @isTest
    static void movePiece_WithMoveCommandEast_shouldMoveOneSquareEast()
    {
        String position = new Exercise().movePiece('RM');

        System.assertEquals('1 0 E', position, 'Wrong position returned');
    }

    @isTest
    static void movePiece_WithMoveCommandSouth_shouldOnlyChangeOrientation()
    {
        String position = new Exercise().movePiece('RRM');

        System.assertEquals('0 0 S', position, 'Wrong position returned');
    }

    @isTest
    static void movePiece_WithMoreMoveCommandsEastThanBoardSize_shouldStopAtEastBorder()
    {
        String position = new Exercise().movePiece('RMMMMM');

        System.assertEquals('4 0 E', position, 'Wrong position returned');
    }

    @isTest
    static void movePiece_WithMultipleCommands_shouldMoveToCorrectPosition()
    {
        String position = new Exercise().movePiece('RMMLMLMRMMRRM');

        System.assertEquals('1 2 S', position, 'Wrong position returned');
    }

    @isTest
    static void movePiece_withMoveCommand_shouldDelegateCommandToHandler()
    {
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        Domain.IMovementHandler handlerMock = new Mocks.MovementHandler(mocks);

        new Exercise(handlerMock).movePiece('M');

        ((Domain.IMovementHandler)mocks.verify(handlerMock, 1)).moveToPosition(Domain.Command.MOVE);
    }

    @isTest
    static void movePiece_withMultipleMoveCommands_shouldCallHandlerForEachCommand()
    {
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        Domain.IMovementHandler handlerMock = new Mocks.MovementHandler(mocks);
        Domain.Command command = Domain.Command.MOVE;

        new Exercise(handlerMock).movePiece('MM');

        ((Domain.IMovementHandler)mocks.verify(handlerMock, 2)).moveToPosition(Domain.Command.MOVE);
    }
}