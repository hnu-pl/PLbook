docker run --rm -p 8888:8888 -v "$PWD":/home/jovyan/pwd --name ihaskell_notebook ghcr.io/ihaskell/ihaskell-notebook:master jupyter lab --LabApp.token=''
