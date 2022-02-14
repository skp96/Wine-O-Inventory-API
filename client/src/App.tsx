import { useState, useEffect } from 'react'
import './App.css';
import './reset-css.css'
import { Wine } from './interfaces/wine_interface'
import { WineList } from './components/WinesList/WineList'
import { Loading } from './components/Loading/Loading'
import { Title } from './components/Title/Title'
import { fetchAllWines } from './api/wine_api'
import { CrudContainer } from './components/CrudContainer/CrudContainer';

const App = () => {
  const [wines, setWines] = useState<Wine[]>([])
  const [isLoading, setIsLoading] = useState(true)
  const [error, setError] = useState("")

  useEffect(() => {
    
    (async () => {try {
      const wines = await fetchAllWines()
      setWines(wines)
      setIsLoading(false)
    } catch (error) {
      setError("Unable to fetch data, please try again later!")
      setWines([])
      setIsLoading(false)
      }
    })()

    return () => {
      setWines([])
      setIsLoading(true)
      setError("")
    }
  },[])
  
  return (
    <div className="App">
      <Title />
      {!error ? (<CrudContainer wines={wines} setWines={setWines}/>) : null}
      {isLoading ? (<Loading />) : (<WineList winesList={wines} error={error} />)}
    </div>
  );
}

export default App
