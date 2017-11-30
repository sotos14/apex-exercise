/**
 *  This class is responsible to calculate the coordinates
 *  of a square on the board for a single movement given the
 *  starting point and a direction.
 */
public class PositionController implements Domain.IPositionController
{
    private Integer boardSize;

    public PositionController(Integer boardSize)
    {
        this.boardSize = boardSize;
    }

    public Domain.Coordinates move(Domain.Coordinates currentCoords, Domain.Direction dir)
    {
        if(dir == Domain.Direction.N && currentCoords.y + 1 < boardSize)
            return new Domain.Coordinates(currentCoords.x, ++currentCoords.y);
        
        else if(dir == Domain.Direction.E && currentCoords.x + 1 < boardSize)
            return new Domain.Coordinates(++currentCoords.x, currentCoords.y);
        
        else if(dir == Domain.Direction.W && currentCoords.x > 0)
            return new Domain.Coordinates(--currentCoords.x, currentCoords.y);
        
        else if(dir == Domain.Direction.S && currentCoords.y > 0)
            return new Domain.Coordinates(currentCoords.x, --currentCoords.y);

        return currentCoords;
    }
}