import axios from "axios";
import { getWinesUrl } from "./base_urls";
import { WineData} from '../interfaces/wine_interface'

export const fetchAllWines = async () => {
    const response = await axios.get(getWinesUrl)
    const wines = response.data
    return wines
}

export const createWine = async (wineData: WineData) => {
    const wineRequestBody = {
        data: {
            type: "wines",
            attributes: {
                name: wineData.name,
                description: wineData.description,
                rating: wineData.rating,
                quantity: wineData.quantity
            }
        }
    }
    const response = await axios.post(getWinesUrl, wineRequestBody)
    const wine = response.data
    return wine
} 
