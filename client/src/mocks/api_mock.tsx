import {WineData} from '../interfaces/wine_interface'

export const createWine = (wineData: WineData) => {
    const wine = {
        data: {
            type: "wines",
            attributes: {
                id: 1,
                name: wineData.name,
                description: wineData.description,
                rating: wineData.rating,
                quantity: wineData.quantity
            }
        }
    }
    return Promise.resolve(wine)
}
