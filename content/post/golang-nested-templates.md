---
title: "Golang Nested Templates"
date: 2017-11-10T04:50:00-07:00
draft: true
tags: [coding]
slug: golang-nested-templates
written: ["2017","2017-11","2017-11-10"]
---

https://play.golang.org/p/OVkruYsBVV

```go
package main

import (
    "bytes"
    "fmt"
    "log"
    "text/template"
)

type View struct {
    Title   string
    Content string
}

func main() {

    header := `
{{define "header"}}
     <head>
         <title>{{ $.Title }}</title>
     </head>
{{end}}`

    page := `
This line should not show
{{define "indexPage"}}
    <html>
    {{template "header" .}}
    <body>
        <h1>{{ .Content }}</h1>
    </body>
    </html>
{{end}}`

    view := View{Title: "some title", Content: "some content"} // Here we try to set which page to view as content
    t := template.New("basic")
    t = template.Must(t.Parse(header))
    t = template.Must(t.Parse(page))
    var tpl bytes.Buffer
    err := t.ExecuteTemplate(&tpl, "indexPage", view)
    if err != nil {
        log.Println("executing template:", err)
    }
    fmt.Println(tpl.String())
}
```