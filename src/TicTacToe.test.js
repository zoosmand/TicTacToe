import { render } from "@testing-library/react";
import TicTacToe from "./TicTacToe";

describe("<TicTacToe />", () => {
  it("Renders title", () => {
    const { getByText } = render(<TicTacToe />);
    expect(getByText(/next player/i)).toBeInTheDocument();
  });
});
