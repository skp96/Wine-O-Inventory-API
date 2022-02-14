import { render } from "@testing-library/react"
import {Error } from './Error'

test('displays an error', async () => {
    const error = "some error"
    const { getByTestId } = render(<Error error={error} />)   

    expect(getByTestId('error')).toHaveTextContent(/some error/i)
})
