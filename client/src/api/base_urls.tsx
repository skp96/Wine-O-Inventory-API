export const getWinesUrl = (process.env.NODE_ENV == 'production' ? "https://wine-o-inventory.herokuapp.com/api/wines" : "http://localhost:4000/api/wines")
