

## velocity model

sfspike > Fvel.rsf mag=1500,3000 nsp=2 k1=1,101 l1=100,200 d1=4 d2=4 \

label1=z label2=x n1=200 n2=200 o1=2 o2=2 unit1=m unit2=m



## Density model

sfspike > Fden.rsf mag=1 nsp=1 k1=1 l1=200 d1=4 d2=4 label1=z \

label2=x n1=200 n2=200 o1=2 o2=2 unit1=m unit2=m



## Source position (x,z)

sfspike n1=2 nsp=2 k1=1,2 mag=400,100 o1=0 o2=0 > Fsou.rsf



## Receiver position (x,z)

sfspike n1=2 nsp=2 k1=1,2 mag=400,100 o1=0 o2=0 > Frec.rsf



## Source wavelet

sfspike nsp=1 n1=2000 d1=0.0005 k1=200 | sfricker1 frequency=20 |\

sftransp > Fwav.rsf



## Creating data at specified receiver + saving full wavefield every 10th step

sfawefd2d < Fwav.rsf vel=Fvel.rsf sou=Fsou.rsf rec=Frec.rsf wfl=Fwfl.rsf \

den=Fden.rsf > Fdat.rsf verb=y free=y expl=y snap=y dabc=y jdata=1 jsnap=10

echo 'label1=z unit1=m label2=x unit2=m' >> Fwfl.rsf



## View the data recorded at receiver

< Fdat.rsf sfwindow |\

sfgraph title='Data recorded at receiver' unit2='' label2=amplitude |\

sfpen



< Fwav.rsf sfgrey gainpanel=a pclip=99 color=j scalebar=y | sfpen



## View the wavefield movie

< Fwfl.rsf sfgrey gainpanel=a pclip=99 color=j scalebar=y | sfpen



