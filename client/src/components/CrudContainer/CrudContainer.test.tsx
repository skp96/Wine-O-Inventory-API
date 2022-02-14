import { render, waitFor } from "@testing-library/react"
import { CrudContainer } from "./CrudContainer"
import userEvent from '@testing-library/user-event'

const default_props = {
    wines: [],
    setWines: () => []
}


test(`displays an Add button`, () => {
    const { getByText } = render(<CrudContainer {...default_props}/>)

    expect(getByText("Add")).toBeInTheDocument()
})

test('click Add button renders a modal', () => {
    const { getByText, getByTestId } = render(<CrudContainer  {...default_props} />)

    userEvent.click(getByText('Add'))
    expect(getByTestId("add-modal-id")).toBeInTheDocument()
})

test('open modal renders a close button', () => {
    const { getByText } = render(<CrudContainer  {...default_props} />)
    
    userEvent.click(getByText('Add'))

    expect(getByText("Close")).toBeInTheDocument()
})

test('clicking close button in open modal closes the modal', async () => {
    const { getByText, queryByText } = render(<CrudContainer  {...default_props}/>)

    userEvent.click(getByText('Add'))

    userEvent.click(getByText("Close"))

    await waitFor(() => {
        expect(queryByText("Close")).not.toBeInTheDocument()
    })
})

test("closing a populated form and reopening results in an empty form", () => {
    const { getByTestId, getByText } = render(<CrudContainer  {...default_props}/>)

    userEvent.click(getByText("Add"))
    
    userEvent.type(getByTestId("form-name-id"), "Some Wine")
    userEvent.type(getByTestId("form-description-id"), "Some wine description")
    userEvent.type(getByTestId("form-rating-id"), "1")
    userEvent.type(getByTestId("form-quantity-id"), "1")

    userEvent.click(getByText("Close"))
    userEvent.click(getByText("Add"))

    expect(getByTestId("form-name-id")).toHaveValue("")
    expect(getByTestId("form-description-id")).toHaveValue("")
    expect(getByTestId("form-rating-id")).toHaveValue(0)
    expect(getByTestId("form-quantity-id")).toHaveValue(0)
})

