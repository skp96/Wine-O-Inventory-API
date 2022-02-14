import { render } from "@testing-library/react"
import { Title } from "./Title"

test("displays a welcome title", () => {
    const { getByText } = render(<Title />)
    
    expect(getByText(/welcome to wine-o inventory/i)).toBeInTheDocument
})
