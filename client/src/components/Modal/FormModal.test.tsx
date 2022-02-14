import { render, waitFor } from "@testing-library/react"
import { FormModal } from "./FormModal"
import userEvent from '@testing-library/user-event'
import { createWine } from "../../mocks/api_mock"
import { setupServer } from "msw/node"
import { error422Handler } from "../../mocks/handlers"
import { Wine } from "../../interfaces/wine_interface"

const default_props_for_add = {
    openAddModal: true,
    handleCloseAddModal: () => false,
    header: "Add Your Wine Below:",
    createWine: createWine,
    updateWinesList: (wine: Wine) => null
}

test("displays a header to add a wine", () => {
    const { getByText } = render(<FormModal {...default_props_for_add}/>)

    expect(getByText("Add Your Wine Below:")).toBeInTheDocument()
})

test("displays a form to create a wine", () => {
    const { getByTestId } = render(<FormModal {...default_props_for_add}/>)

    expect(getByTestId("form-id")).toBeInTheDocument()
})

test("displays a button to submit the form", () => {
    const { getByText } = render(<FormModal {...default_props_for_add}/>)

    expect(getByText("Submit")).toBeInTheDocument()
})

test("user can fill out the form", () => {
    const { getByTestId } = render(<FormModal {...default_props_for_add} />)

    userEvent.type(getByTestId("form-name-id"), "Some Wine")
    userEvent.type(getByTestId("form-description-id"), "Some wine description")
    userEvent.type(getByTestId("form-rating-id"), "1")
    userEvent.type(getByTestId("form-quantity-id"), "1")

    expect(getByTestId("form-name-id")).toHaveValue("Some Wine")
    expect(getByTestId("form-description-id")).toHaveValue("Some wine description")
    expect(getByTestId("form-rating-id")).toHaveValue(1)
    expect(getByTestId("form-quantity-id")).toHaveValue(1)
    
})

test("display successful form submittion message upon submitting form correctly", async () => {
    const { getByTestId, getByText} = render(<FormModal {...default_props_for_add} />)

    userEvent.type(getByTestId("form-name-id"), "Some Wine")
    userEvent.type(getByTestId("form-description-id"), "Some wine description")
    userEvent.type(getByTestId("form-rating-id"), "1")
    userEvent.type(getByTestId("form-quantity-id"), "1")

    userEvent.click(getByText("Submit"))

    await waitFor(() => getByTestId("submit-success-id"))

    expect(getByTestId("submit-success-id")).toBeInTheDocument()
})

test("failure to submit form correctly redners error messages", async () => {
    const server = setupServer(error422Handler)
    server.listen()

    const { getByTestId, getByText } = render(<FormModal {...default_props_for_add} />)

    userEvent.click(getByText("Submit"))

    await waitFor(() => getByTestId("submit-error-id"))

    expect(getByTestId("submit-error-id")).toBeInTheDocument()

    server.resetHandlers()
    server.close()
})
