syn match Constant '\v<\d+\zs_\ze\d+>' conceal cchar=,

syn match Normal '\v<not in>' conceal cchar=∉
syn match Normal '\v<in>' conceal cchar=∈

syn match Normal '<=' conceal cchar=≤
syn match Normal '>=' conceal cchar=≥

syn match Normal '!=' conceal cchar=≠

syn keyword Normal for conceal cchar=∀
syn keyword Normal while conceal cchar=⥁
syn keyword Keyword continue conceal cchar=↻

syn keyword Normal def conceal cchar=λ

syn keyword Operator lambda conceal cchar=λ
