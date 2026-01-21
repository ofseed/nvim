; extends

; Conceal all list markers to a bullet point,
; All bullet points chosen to match GitHub's rendering of markdown lists.
; 1st level list markers
(list
  (list_item
    ([
      (list_marker_minus)
      (list_marker_plus)
      (list_marker_star)
    ] @markup.list
      (#trim! @markup.list 1 1 1 1)
      (#set! conceal "•"))))

; 2nd level list markers
(list
  (list_item
    (list
      (list_item
        ([
          (list_marker_minus)
          (list_marker_plus)
          (list_marker_star)
        ] @markup.list
          (#trim! @markup.list 1 1 1 1)
          (#set! conceal "◦"))))))

; 3rd or more level list markers
(list
  (list_item
    (list
      (list_item
        (list
          (list_item
            ([
              (list_marker_minus)
              (list_marker_plus)
              (list_marker_star)
            ] @markup.list
              (#trim! @markup.list 1 1 1 1)
              (#set! conceal "▪"))))))))
