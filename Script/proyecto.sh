 #!/bin/bash
 informe () {
 pdflatex ../Informe/informe.tex
 evince informe.pdf
}
 presentacion () {
 pdflatex ../Presentacion/document.tex
 evince document.pdf
}
 ejecutar () {
 cd ../moogle-main
 ```
 make dev
 ```
 }
  
  show_presentacion () {
  pdflatex ../Presentacion/document.tex
  case $2 in
  xpdf)
  xpdf document.pdf
  ;;
  acroread)
  acroread document.pdf
  ;;
  *)
  evince document.pdf
  ;;
  esac 
  }
  
  vaciar () {
  cd ../Script
  rm *.{aux,log,pdf,nav,out,snm,toc,vrb}
  }  
  
  
 case $1 in
 report)
 informe
 ;;
 slides)
 presentacion
;; 
run)
 ejecutar
 ;;
 clean)
 vaciar
 ;;
 show_slides)
 pdflatex ../Presentacion/document.tex
 var=$2
 if [[ ${#var} -eq 0 ]]
 then
 evince document.pdf
 else
 $var document.pdf 
 fi
 ;;
 show_report)
 pdflatex ../Informe/informe.tex
 var=$2
 if [[ ${#var} -eq 0 ]]
 then
 evince informe.pdf
 else
 $var informe.pdf 
 fi
 ;;
 *)
 echo error
;;
esac

