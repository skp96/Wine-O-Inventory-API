import { render, waitFor } from "@testing-library/react"
import { setupServer } from "msw/node"
import { getWinesHandler, errorHandler, postWinesHandler } from "./mocks/handlers"
import userEvent from '@testing-library/user-event'
import App from "./App"

const server = setupServer(getWinesHandler, postWinesHandler)

beforeAll(() => server.listen())
afterEach(() => server.resetHandlers())
afterAll(() => server.close())

test('fetches and displays a wine list', async () => {
    const { getByTestId } = render(<App />)

    await waitFor(() => getByTestId('show-inventory'))

    expect(getByTestId('show-inventory')).toHaveTextContent(/wine inventory/i)
})

test('displays an error when unable to fetch wines', async () => {
    server.use(errorHandler)

    const { getByTestId } = render(<App />)   

    await waitFor(() => getByTestId('error'))

    expect(getByTestId('error')).toHaveTextContent(/unable to fetch data, please try again/i)
})

test('when there is an error, inventory options are unavailable', async () => {
    server.use(errorHandler)

    const { queryByText } = render(<App />)   

    await waitFor(() => {
        expect(queryByText("Add")).not.toBeInTheDocument()
    })
})

test('upon successfully creating of a wine, it is added to the list of wines and rendered', async () => {
    const { getByText, findAllByRole, getByTestId } = render(<App />)

    await waitFor(() => getByTestId('show-inventory'))

    userEvent.click(getByText('Add'))

    userEvent.type(getByTestId("form-name-id"), "test wine")
    userEvent.type(getByTestId("form-description-id"), "test wine")
    userEvent.type(getByTestId("form-rating-id"), "1")
    userEvent.type(getByTestId("form-quantity-id"), "1")

    userEvent.click(getByText("Submit"))

    await waitFor(() => getByTestId("submit-success-id"))

    userEvent.click(getByText("Close"))

    expect(await findAllByRole('row')).toHaveLength(3)
})
