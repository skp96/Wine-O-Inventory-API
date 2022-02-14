import { rest } from 'msw'
import { getWinesUrl } from '../api/base_urls'

export const getWinesHandler = rest.get(getWinesUrl, (req, res, ctx) => {
    return res(ctx.json([{ id: 1, name: "test wine", description: "test wine", rating: 1, quantity: 1 }]))
})

export const postWinesHandler = rest.post(getWinesUrl, (req, res, ctx) => {
    return res(ctx.json({
        data: {
            type: "wines",
            attributes: {
                id: 2,
                name: "test wine",
                description: "test wine",
                rating: 1,
                quantity: 1
            }
            
        }
    }))
})
    
export const errorHandler = rest.get(getWinesUrl, (req, res, ctx) => {
    return res(ctx.status(500))
})

export const error422Handler = rest.post(getWinesUrl, (req, res, ctx) => {
    return res(ctx.status(422), ctx.json({
        errors: {
            description: ["can't be blank"],
            name: ["can't be blank"],
            quantity: ["can't be blank"],
            rating: ["can't be blank"]
        }
    }))
})
