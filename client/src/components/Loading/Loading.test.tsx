import { render } from "@testing-library/react"
import {Loading} from './Loading'

test('renders loading', () => {
    const { getByText } = render(<Loading />)

    expect(getByText(/loading.../i)).toBeInTheDocument
})
