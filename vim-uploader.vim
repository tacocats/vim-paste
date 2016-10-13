if !has('python3')
    finish
endif

" echo line ("$") = line count

function! Paste(title)
" Python starts here
python3 << EOF

import requests
import vim

def pasteText(text):
    # combine the text list into one string with each line as \n
    combinedString = "\n".join(text)
    
    codeTitle = vim.eval("a:title")

    payload = {"code" : combinedString, "title" : codeTitle}

    r = requests.post ("https://api.teknik.io/v1/Paste", data=payload)
    
    # Display the response from the server
    print (r.text)

# Send the current buffers text to pasteText as a list 
text = (vim.current.buffer[0:])
pasteText(text)


EOF

endfunc


"call Test()

