import { render } from '@testing-library/react';
import { WineList } from "./WineList"
import { Wine } from '../../interfaces/wine_interface';


const defaultProps = {
  winesList: [],
  error: ""
}

test('renders a title', () => {
  const { getByText } = render(<WineList {...defaultProps}/>)
  expect(getByText(/wine inventory/i)).toBeInTheDocument()
});

test('renders a wine item', () => {
  const fakeWinesList: Wine[] = [{ id: 1, name: "test wine", description: "test wine description", rating: 1, quantity: 1 }]
  const { getByText } = render(<WineList winesList={fakeWinesList} error={""} />)

  expect(getByText("test wine")).toBeInTheDocument()
})

test('renders a list of wine items', () => {
  const fakeWinesList: Wine[] = [
    { id: 1, name: "test wine", description: "test wine description", rating: 1, quantity: 1 },
    { id: 2, name: "another test", description: "another test description", rating: 2, quantity: 2 }
  ]
  const { getByText } = render(<WineList winesList={fakeWinesList} error={""} />)
  
  expect(getByText("test wine")).toBeInTheDocument()
  expect(getByText("another test")).toBeInTheDocument()
})
