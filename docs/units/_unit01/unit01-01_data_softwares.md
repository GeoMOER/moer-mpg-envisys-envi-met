---
title: Data and Software
toc: true
toc_label: In this worksheet

header:
  image: "/assets/images/envi_met_title.png"
  image_description: "modeling domain"
  caption: "gisma / CC0"

panel1:  
  - url: "https://w.wiki/Qvs"
    image_path: "/assets/images/QR.png"
    title: "QR Code data server"
    alt: "QR Code data server"


---
Please use the following resources for retrieving the required data and software.


<!--more-->


## Data set for training purposes

{% include gallery id="panel1" layout="third" caption="[Course Data Server](https://137.248.191.215:8989/sharing/SxrDkOsBp) Data folder for any file exchange and data related purposes." %} 


## Specific modeling software 

Please find all Downloads according to ENVI-met at the [ENVI-met landing page](https://envi-met.info/doku.php?id=start)


## Common Software 

Shell — any command line environment will do for the exercises. For Linux we recommend the [bash](http://en.wikipedia.org/wiki/Bash_%28Unix_shell%29) shell. For Windows the Windows command line can be used.

* [QGIS](HTTP://www.qgis.org/de/docs/user_manual/index.html#qgis-manual-index-reference) has become one of the most promising and most integrative open source GIS systems over the last years. Through the processing plugin, it additionally integrates modules from the other leading free GIS solutions. We will need it (if necessary) to prepare or manipulate some of the data.

Regarding installation, for Ubuntu Linux, the [Ubuntu GIS package](https://wiki.ubuntu.com/UbuntuGIS) is a good choice. For Windows, we strongly recommend installing everything via the [OSGeo4W](http://trac.osgeo.org/osgeo4w/) environment and not the standalone QGIS installation tool. 

For most of the data pre and postprocessing, we will use the statistical scripting language [R](https://cran.r-project.org/) and we highly recommend the  [Rstudio](https://rstudio.com/) integrated developing environment. 

Please follow the instructions according to your operating system.


## Additional data sources

[Marburg Open Forest data base](https://github.com/MarburgOpenForest/MOFGeoDB.git) Marburg Open Forest data base for static data. You will find some example R-code for manipulation and extraction. Additionally the data is in a QGIS pProject container.


