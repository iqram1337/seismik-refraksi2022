sfawefd2d < Fwav.rsf vel=Fvel.rsf sou=Fsou.rsf rec=Frec.rsf wfl=Fwfl.rsf den=Fden.rsf > Fdat.rsf verb=y free=y expl=y snap=y dabc=y jdata=1 jsnap=50 
echo 'label1=z unit1=m label2=x unit2=m' >> Fwfl.rsf


## View the data recorded at receiver
< Fdat.rsf sfwindow |\
sfgraph title='Data recorded at receiver' unit2='' label2=amplitude |\
sfpen

## View the wavefield movie
< Fwfl.rsf sfgrey gainpanel=a pclip=99 color=j scalebar=y | sfpen

