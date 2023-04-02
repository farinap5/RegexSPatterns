horario = /(?:\s|^)
(
    (?: [0-9]+ \s+ (?:horas?|minutos?) )                            | 
    (?: as \s+ (?: (?:[0-1]?[0-9]) | (?:2[0-4]) )(?: :[0-5][0-9])?) |
    (?: (?:[0-1][0-9]) | (?:2[0-4]))  (?: :[0-5][0-9])?
    
)(?:(?!(?:\s|$|\,|\.)).)*
/sxi

datas = /(?:\s|^)
(
    (?: (?:(?:[0-2]?[0-9])|(?:3[0-1])) \s+ (?:de\s+)? (?:janeiro|fevereiro|marco|abril|junho|julho|agosto|setembro|outubro|novembro|dezembro)) |
    (?: (?:(?:[0-2]?[0-9])|(?:3[0-1]))  \/  (?:[0-1]?[0-9])  \/  [0-9][0-9](?:[0-9][0-9])? ) |
    (?: hoje|amanha|depois\s+de\s+amanha|antes\s+de\s+ontem )
)(?:(?!(?:\s|$|\,|\.)).)*
/sxi

hashtag = /(?:\s|^)
(
    (?:  \#[a-z0-9]+  )
)(?:(?!(?:\s|$|\,|\.)).)*
/sxi

acoes = /(?:\s|^)
    ((?:agendar|marcar|liga|escrever|anotar|fazer))
(?:(?!(?:\s|$|\,|\.)).)*
/sxi


pessoas = /
((?:\s|^)
    (?: [A-Z][a-z]* )
)(?:(?!(?:\s|$|\,|\.)).)*
/sx

list = []
note = "Agendar com Josa reuniao as 10:00 amanha #trabalho"

puts list

list.append(note.scan(horario))
list.append(note.scan(datas))
list.append(note.scan(hashtag))
list.append(note.scan(acoes))
list.append(note.scan(pessoas))

for i in list do
    puts note.sub(i.join(""), "\033[96m"+i.join("")+"\033[0m")
end 