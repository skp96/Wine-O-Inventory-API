export const getWinesUrl = (process.env.NODE_ENV == 'production' ? "http://18.219.145.180:8080/api/wines" : "http://localhost:4000/api/wines")
