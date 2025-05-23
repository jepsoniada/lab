Array.prototype.chunkBy = function (n) {
    return this.slice(n).reduce(([head, ...tail], a, i) => i%n
                                ? [[head, a], ...tail]
                                : [a, head, ...tail], [this.slice(0, n)])
}

let method = new Proxy({}, {
    get(_, prop) {
        return (...r) => a => a[prop](...r)
    }
})
let operator = new Proxy((function(){}), {
    op: [...[ ..."<>%-+&|^~"
              , ..."==!=<=>=**<<>>&&||in".split('').chunkBy(2).map(method.join(''))
              , ..."===!==>>>".split('').chunkBy(3).map(method.join(''))
              , "instanceof"
            ]
        ],
    apply(_, __, args) {
        // return `[${this.op.join("asdf")}]`
        if (!this.op.includes(args[0][0])) {
            throw "not an operator"
        }
        return (...r) => r.join(` ${args[0][0]} `) // eval(r.join(` ${args[0][0]} `))
    }
})

let [_, __] = [operator, method]

console.log((()=>{
    // return _`+`(1, 2)
    return [1,2].reduce((...r) => r.join(` + `))
    // return [1,2].reduce(_`+`)
    // return [[1,2]].map(__.reduce((acc, a) => acc + a))
    // return [[1,2]].map(__.reduce(_`+`))
    // return [[1,9],[2,8]].map(__.reduce(_`+`))
})())
