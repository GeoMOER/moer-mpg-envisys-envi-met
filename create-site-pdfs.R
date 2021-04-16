# pandoc https://geomoer.github.io/moer-bsc-systemdynamik/assignments/unit00-02_assignments.html -f markdown-raw_tex -V colorlinks -V urlcolor=NavyBlue -V toccolor=Reds -f html-native_divs -o /home/creu/edu/courses/moer/moer-bsc-systemdynamik/docs/assets/pdf/unit00-02_assignments.pdf --pdf-engine=pdflatex
# wkhtmltopdf  --page-size A1 --footer-left [webpage]  --footer-font-size 8 --footer-line --header-left [title] --header-line --margin-top 30 --margin-left 25 --margin-right 25 --margin-bottom 15  https://geomoer.github.io/moer-bsc-systemdynamik/assignments/unit00-02_assignments.html  /home/creu/edu/courses/moer/moer-bsc-systemdynamik/docs/assets/pdf/unit00-02_assignments.pdf
zip = TRUE
wkhtml = TRUE
local = FALSE

# get all related files in the docs directory
files = list.files(dirname(rstudioapi::getActiveDocumentContext()$path), 
                   recursive = TRUE, full.names = TRUE)

# strip the repo name
repo = strsplit(strsplit(files[[1]],"courses/moer")[[1]][2],"/")[[1]][2]

# strip the filename
md_files = xfun::sans_ext(basename(files[grep("/units/", files)]))

# create outpath string
outpath = paste0(getwd(),"/docs/assets/pdf/")

# pandocs calling argument 
pan_arguments=' -f markdown-raw_tex -V colorlinks -V urlcolor=NavyBlue -V toccolor=Reds -f html-native_divs '

# wkhtml calling argument
wkhtml_arguments=" --footer-left [webpage]  --footer-font-size 8 --footer-line --header-left [title] --header-line --margin-top 30 --margin-left 25 --margin-right 25 --margin-bottom 15 "



if (local){
  # create url on github 
  url = paste0("http://127.0.0.1:4000/",repo,"/")
} else {
  # create local url
  url = paste0("https://geomoer.github.io/",repo,"/")
}

if (!wkhtml){
   res= lapply(md_files, function(x){
    system(paste0("pandoc ",url,strsplit(strsplit(strsplit(x = x,split = "_")[[1]][1],"/")[[1]][1],"-")[[1]][1],"/",xfun::sans_ext(basename(x)),".html ",pan_arguments, "-o ",outpath, xfun::sans_ext(basename(x)),".pdf ","--pdf-engine=pdflatex"),wait = TRUE)
  })
  system(paste0("pandoc ",url,"index.html ",pan_arguments, "-o ",outpath, "index.pdf ","--pdf-engine=pdflatex"),wait = TRUE)
} else if (wkhtml) {
  res= lapply(md_files, function(x){
    cmd=paste0(wkhtml_arguments, " ",url,strsplit(strsplit(strsplit(x = x,split = "_")[[1]][1],"/")[[1]][1],"-")[[1]][1],"/",xfun::sans_ext(basename(x)),".html ",outpath, xfun::sans_ext(basename(x)),".pdf")
    system(paste("wkhtmltopdf ",cmd))
  })
  system(paste0("wkhtmltopdf ",wkhtml_arguments, " ",url,"index.html ",outpath, "index.pdf "),wait = TRUE)
}

if (zip){
  # zip the pdfs
  files2zip <- dir(outpath, full.names = TRUE)
  zipfile = paste0(outpath,repo,".zip")
  pdfpath= strsplit(outpath,"pdf")[[1]][1]
  zip::zip(zipfile, "pdf" , root = pdfpath,include_directories = FALSE,compression_level = 9)
}
