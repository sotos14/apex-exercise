public class Exercise
{
    private static final Integer BOARD_SIZE = 5;
    private static final Map<Integer, Domain.Command> CHAR_TO_COMMAND = new Map<Integer, Domain.Command>{
        82 => Domain.Command.ROTATE_RIGHT,
        76 => Domain.Command.ROTATE_LEFT,
        77 => Domain.Command.MOVE
    };

    private Domain.IMovementHandler movementHandler;

    public Exercise()
    {
        this(new MovementHandler(new Domain.Position(), BOARD_SIZE));
    }

    public Exercise(Domain.IMovementHandler movementHandler)
    {
        this.movementHandler = movementHandler;
    }

    /**
     *  The Entry point.
     *  This method calculates the end position of a piece on a 
     *  5x5 square Board based on the instructions given.
     */
    public String movePiece(String instructions)
    {   
        Domain.Position position;

        for(Integer character : instructions.getChars())
        {
            Domain.Command command = CHAR_TO_COMMAND.get(character);
            position = movementHandler.moveToPosition(command);
        }

        return position != null ? position.toString() : null;
    }
}