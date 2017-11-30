/**
 *  This class is responsible to calculate a new position
 *  based on a Command given.
 */
public class MovementHandler implements Domain.IMovementHandler
{
    private Domain.IDirectionController directionController;
    private Domain.IPositionController positionController;
        
    private Domain.Position position;

    public MovementHandler(Domain.Position position, Integer boardSize)
    {
        this(position, new DirectionController(), new PositionController(boardSize));
    }

    public MovementHandler(
        Domain.Position position,
        Domain.IDirectionController directionController,
        Domain.IPositionController positionController)
    {
        this.directionController = directionController;
        this.positionController = positionController;
        this.position = position;
    }

    public Domain.Position moveToPosition(Domain.Command com)
    {
        Domain.Direction currentDirection = position.dir;
        Domain.Coordinates currentCoordinates = position.coords;
        Domain.Direction nextDirection;
        Domain.Coordinates nextCoords;

        if(com == Domain.Command.MOVE)
            nextCoords = positionController.move(currentCoordinates, currentDirection);
        else
            nextDirection = directionController.rotate(currentDirection, com);

        if(nextDirection != null)
            position.dir = nextDirection;
        else
            position.coords = nextCoords;
        
        return position;
    }
}