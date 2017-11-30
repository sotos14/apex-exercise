/**
 *  This class is holding all the objects and
 *  interfaces used by the domain.
 */
public class Domain 
{
    public enum Direction { N, E, S, W }
    public enum Command { MOVE, ROTATE_LEFT, ROTATE_RIGHT }

    /**
     *  Users of this interface can calculate a direction (N, E, S, W)
     *  based on a given starting direction and a command that specifies
     *  the rotation (left or right).
     */
    public interface IDirectionController
    {
        Domain.Direction rotate(Domain.Direction currentDirection, Domain.Command com);
    }

    /**
     *  Users of this interface can calculate the resulting
     *  coordinates given the starting coordinates and the
     *  direction of the movement.
     */
    public interface IPositionController
    {
        Domain.Coordinates move(Domain.Coordinates currentCoords, Domain.Direction direction);
    }

    /**
     *  Users of this interface can calculate the resulting
     *  Position (Coordinates and Direction) given a Command.
     */
    public interface IMovementHandler
    {
        Domain.Position moveToPosition(Domain.Command com);
    }

    /**
     *  This class represents a specific square
     *  on the board.
     */
    public class Coordinates
    {
        public Integer x {get; private set;}
        public Integer y {get; private set;}
        
        public Coordinates(Integer x, Integer y)
        {
            this.x = x;
            this.y = y;
		}
	}

    /**
     *  This class represents the position of a piece
     *  on the bord. It contains information about the
     *  coordinates of the square that the piece is and
     *  its direction.
     */
    public class Position 
    {
        public Coordinates coords {get; set;}
        public Direction dir {get; set;}
        
        public Position()
        {
            this(new Coordinates(0,0), Direction.N);
		}
        
        public Position(Coordinates coords, Direction dir)
        {
            this.coords = coords;
            this.dir = dir;
        }
        
        public override String toString()
        {
            return coords.x +' '+ coords.y +' '+ dir;
        }
    }
}