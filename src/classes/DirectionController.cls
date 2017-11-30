/**
 *  This class is responsible to calcuate the resulted
 *  direction given a starting direction and a command.
 */
public class DirectionController implements Domain.IDirectionController
{
    List<Domain.Direction> directions;

    public DirectionController()
    {
        directions = Domain.Direction.values();
    }

    public Domain.Direction rotate(Domain.Direction currentDirection, Domain.Command com)
    {
        Integer index = currentDirection.ordinal();
        Integer rotationDirection = com == Domain.Command.ROTATE_RIGHT ? 1 : -1;

        if(com == Domain.Command.ROTATE_RIGHT && index == directions.size() - 1)
        {
            return directions[0];
        }
        else if(com == Domain.Command.ROTATE_LEFT && index == 0)
        {
            return directions[directions.size() - 1];
        }

        return directions[index + (1 * rotationDirection)];
    }
}