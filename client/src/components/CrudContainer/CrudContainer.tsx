import { useState } from "react"
import { FormModal } from '../Modal/FormModal'
import Button from '@mui/material/Button'
import { createWine } from '../../api/wine_api'
import { Wine, WineData } from "../../interfaces/wine_interface"

export const CrudContainer: React.FC<{
  wines: Wine[]
  setWines: (wines: Wine[]) => void
}> = ({wines, setWines}) => {
  const [openAddModal, setOpenAddModal] = useState(false)

  const handleOpenAddModal = () => setOpenAddModal(true)
  const handleCloseAddModal = () => setOpenAddModal(false)
    
  const updateWinesList = (wine: Wine) => {
    setWines([...wines, wine])
  }

  return (
    <section className='section-buttons'>
      <Button variant='outlined' onClick={handleOpenAddModal}>Add</Button>
        <FormModal
          openAddModal={openAddModal}
          handleCloseAddModal={handleCloseAddModal}
          header={"Add Your Wine!"}
          createWine={createWine}
          updateWinesList={updateWinesList}
        />
    </section>
  )
}
