## SencillitoCLI

This is a CLI utility made in BASH for find debts using the Sencillito API (only Chile), you can save your accounts to a file and find all the debts simple running `sencillito` in your terminal.

# Usage

    sencillito [[-a] <store_code> <account_ref> | -s <query> | -h]

        Program for search debts using Sencillito API.
	
        -a		        add account to conf file (~/.config/sencillito)
        -s <query>	    search for store_code
        -h		        show this help text

# Examples
Search for Directv `store_code`

    $ sencillito -s directv
    "code":3710,"title":"DIRECTV CONVENIO MATRIZ"
    "code":3711,"title":"Directv Mensualidades - Rut"
    "code":3712,"title":"Directv Mensualidades - Suscriptor"
    "code":3713,"title":"Directv Instalaciones - Rut"

Use the `store_code` and your `account_ref` (usually your RUT or client number, only numbers) for get the total of your current debt.

    $ sencillito 3711 150550555
    49990
    
Add the account to your conf file

    $ sencillito -a 3711 150550555

Get debts from conf file

    $ sencillito
    49990

# Installation

This bash script internally use **curl**.

    git clone https://github.com/cristoferfb/sencillitocli
    cd sencillitocli
    sudo make install 

