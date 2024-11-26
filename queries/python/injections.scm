((string_content) @injection.content
  (#match? @injection.content "INSERT|SELECT|UPDATE|DELETE|REPLACE")
  (#set! include-children)
  (#set! injection.language "sql"))
