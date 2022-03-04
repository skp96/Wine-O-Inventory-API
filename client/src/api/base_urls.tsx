export const getWinesUrl = (process.env.NODE_ENV == 'production' ? "http://ec2-18-219-145-180.us-east-2.compute.amazonaws.com:8080/api/wines" : "http://localhost:4000/api/wines")
