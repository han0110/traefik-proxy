const Koa = require('koa')
const app = new Koa()

const { ID, PORT } = process.env

app.use(async (ctx, next) => {
    const host = ctx.headers.host
    const url = ctx.request.url
    const strippedPrefix = ctx.headers['x-forwarded-prefix'] || ''

    console.log(`------------------------------
Host: ${host}
URL: ${url}
Stripped Prefix: ${strippedPrefix}
------------------------------`)

    return next()
})

app.use(async ctx => {
    ctx.body = `<h1>${ID}</h1>`
})

app.listen(process.env.PORT, () => {
    console.log(`Koa ID=${ID} listening on ${PORT}`)
})
