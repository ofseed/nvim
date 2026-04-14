; extends

(import_declaration
  name: (module_name (identifier) @module)
)

(module_declaration
  name: (module_name (identifier) @module)
)

["import" "export"] @keyword

["module"] @keyword.type
