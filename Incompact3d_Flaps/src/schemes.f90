#include "debug.h"
!********************************************************************
!
subroutine schemas()
!
!********************************************************************

USE param
USE derivX
USE derivY
USE derivZ
USE variables

implicit none

integer :: i, j, k 
real(8) :: fpi2

alfa1x= 2.
af1x  =-(5./2.  )/dx
bf1x  = (   2.  )/dx
cf1x  = (1./2.  )/dx
df1x  = 0.
alfa2x= 1./4.
af2x  = (3./4.  )/dx
alfanx= 2.
afnx  =-(5./2.  )/dx
bfnx  = (   2.  )/dx
cfnx  = (1./2.  )/dx
dfnx  = 0.
alfamx= 1./4.
afmx  = (3./4.  )/dx
if (iord.eq.6) then
alfaix= 1./3.
afix  = (7./9.  )/dx
bfix  = (1./36. )/dx
elseif (iord.eq.2) then
alfaix= 0.
afix  = (1.  )/dx
bfix  = (0. )/dx
endif
alsa1x= 11.
as1x  = (13.    )/dx2
bs1x  =-(27.    )/dx2
cs1x  = (15.    )/dx2
ds1x  =-(1.     )/dx2
alsa2x= 1./10.
as2x  = (6./5.  )/dx2
alsanx= 11.
asnx  = (13.    )/dx2
bsnx  =-(27.    )/dx2
csnx  = (15.    )/dx2
dsnx  =-(1.     )/dx2
alsamx= 1./10.
asmx  = (6./5.  )/dx2
if (iord.eq.6) then
      as3x  = (12./11.)/dx2
      bs3x  = (3./44. )/dx2
      astx  = (12./11.)/dx2
      bstx  = (3./44. )/dx2
!alsaix= 2./11.
!asix  = (12./11.)/dx2
!bsix  = (3./44. )/dx2
      fpi2=4.
!      fpi2=(48./7)/(pi*pi)
      alsaix=(45.*fpi2*pi*pi-272.)/(2.*(45.*fpi2*pi*pi-208.))
      asix  =((6.-9.*alsaix)/4.)/dx2
      bsix  =((-3.+24*alsaix)/5.)/(4.*dx2)
      csix  =((2.-11.*alsaix)/20.)/(9.*dx2)
elseif (iord.eq.2) then
      as3x  = (1.)/dx2
      bs3x  = (0. )/dx2
      astx  = (1.)/dx2
      bstx  = (0. )/dx2
alsaix= 0.
asix  = (1.)/dx2
bsix  = (0.)/dx2
 csix  =(0.)/(9.*dx2)
endif      
!      stop
#if DEBUG
      write(*,*) '=== derxx ==='
      write(*,*) alsaix
      write(*,*) asix*dx2
      write(*,*) bsix*4*dx2
      write(*,*) csix*9*dx2
      write(*,*) '============='
#endif
alfa1y= 2.
af1y  =-(5./2.  )/dy
bf1y  = (   2.  )/dy
cf1y  = (1./2.  )/dy
df1y  = 0.
alfa2y= 1./4.
af2y  = (3./4.  )/dy
alfany= 2.
afny  =-(5./2.  )/dy
bfny  = (   2.  )/dy
cfny  = (1./2.  )/dy
dfny  = 0.
alfamy= 1./4.
afmy  = (3./4.  )/dy
if (iord.eq.6) then
alfajy= 1./3.
afjy  = (7./9.  )/dy
bfjy  = (1./36. )/dy
elseif (iord.eq.2) then
alfajy= 0.
afjy  = (1.  )/dy
bfjy  = (0. )/dy
endif
alsa1y= 11.
as1y  = (13.    )/dy2
bs1y  =-(27.    )/dy2
cs1y  = (15.    )/dy2
ds1y  =-(1.     )/dy2
alsa2y= 1./10.
as2y  = (6./5.  )/dy2
alsany= 11.
asny  = (13.    )/dy2
bsny  =-(27.    )/dy2
csny  = (15.    )/dy2
dsny  =-(1.     )/dy2
alsamy= 1./10.
asmy  = (6./5.  )/dy2
if (iord.eq.6) then
      as3y  = (12./11.)/dy2
      bs3y  = (3./44. )/dy2
      asty  = (12./11.)/dy2
      bsty  = (3./44. )/dy2
!alsajy= 2./11.
!asjy  = (12./11.)/dy2
!bsjy  = (3./44. )/dy2
      alsajy=(45.*fpi2*pi*pi-272.)/(2.*(45.*fpi2*pi*pi-208.))
      asjy  =((6.-9.*alsajy)/4.)/dy2
      bsjy  =((-3.+24*alsajy)/5.)/(4.*dy2)
      csjy  =((2.-11.*alsajy)/20.)/(9.*dy2)
elseif (iord.eq.2) then      
      as3y  = (1.)/dy2
      bs3y  = (0. )/dy2
      asty  = (1.)/dy2
      bsty  = (0. )/dy2
alsajy= 0.
asjy  = (1.)/dy2
bsjy  = (0. )/dy2
 csjy  =(0.)/(9.*dy2)  
endif      
#if DEBUG
      write(*,*) '=== deryy ==='
      write(*,*) alsajy
      write(*,*) asjy*dy2
      write(*,*) bsjy*4*dy2
      write(*,*) csjy*9*dy2
      write(*,*) '============='
#endif
if (iord.eq.6) then      
alcaix6=9./62. 
acix6=(63./62.)/dx
bcix6=(17./62.)/3./dx 
elseif (iord.eq.2) then
alcaix6=0. 
acix6=(1.)/dx
bcix6=(0.)/3./dx 
endif

cfx6(1)=alcaix6 
cfx6(2)=alcaix6 
cfx6(nxm-2)=alcaix6 
cfx6(nxm-1)=alcaix6 
cfx6(nxm)=0. 
if (nclx==0) ccx6(1)=2.  
if (nclx==1) ccx6(1)=1. + alcaix6 
if (nclx==2) ccx6(1)=1. + alcaix6 
ccx6(2)=1. 
ccx6(nxm-2)=1. 
ccx6(nxm-1)=1. 
if (nclx==0) ccx6(nxm)=1. + alcaix6*alcaix6  
if (nclx==1) ccx6(nxm)=1. + alcaix6 
if (nclx==2) ccx6(nxm)=1. + alcaix6
cbx6(1)=alcaix6 
cbx6(2)=alcaix6 
cbx6(nxm-2)=alcaix6 
cbx6(nxm-1)=alcaix6 
cbx6(nxm)=0. 
do i=3,nxm-3 
   cfx6(i)=alcaix6 
   ccx6(i)=1. 
   cbx6(i)=alcaix6 
enddo

cfi6(1)=alcaix6 + alcaix6 
cfi6(2)=alcaix6 
cfi6(nx-2)=alcaix6 
cfi6(nx-1)=alcaix6 
cfi6(nx)=0. 
cci6(1)=1. 
cci6(2)=1. 
cci6(nx-2)=1. 
cci6(nx-1)=1. 
cci6(nx)=1. 
cbi6(1)=alcaix6 
cbi6(2)=alcaix6 
cbi6(nx-2)=alcaix6 
cbi6(nx-1)=alcaix6 + alcaix6 
cbi6(nx)=0. 
do i=3,nx-3 
   cfi6(i)=alcaix6 
   cci6(i)=1. 
   cbi6(i)=alcaix6 
enddo
if (iord.eq.6) then 
 ailcaix6=3./10.!0.49
 aicix6=1./128.*(75.+70.*ailcaix6)!1./128.*(75.+70.*ailcaix6)!1.749875/2.
 bicix6=1./256.*(126.*ailcaix6-25.)!1./256.*(126.*ailcaix6-25.)!0.249925/2.
 cicix6=1./256.*(-10.*ailcaix6+3.)!1./256.*(-10.*ailcaix6+3.)!0.
elseif (iord.eq.2) then
 ailcaix6=0.
 aicix6=1.
 bicix6=0.
 cicix6=0.
endif
!
print *,'New coef Inter X',aicix6,bicix6,cicix6
!aicix6=3./4. 
!bicix6=1./20. 
cifx6(1)=ailcaix6 
cifx6(2)=ailcaix6 
cifx6(nxm-2)=ailcaix6 
cifx6(nxm-1)=ailcaix6 
cifx6(nxm)=0. 
if (nclx==0) cicx6(1)=2.  
if (nclx==1) cicx6(1)=1. + ailcaix6 
if (nclx==2) cicx6(1)=1. + ailcaix6 
cicx6(2)=1. 
cicx6(nxm-2)=1. 
cicx6(nxm-1)=1. 
if (nclx==0) cicx6(nxm)=1. + ailcaix6*ailcaix6
if (nclx==1) cicx6(nxm)=1. + ailcaix6 
if (nclx==2) cicx6(nxm)=1. + ailcaix6
cibx6(1)=ailcaix6 
cibx6(2)=ailcaix6 
cibx6(nxm-2)=ailcaix6 
cibx6(nxm-1)=ailcaix6 
cibx6(nxm)=0. 
do i=3,nxm-3 
   cifx6(i)=ailcaix6 
   cicx6(i)=1. 
   cibx6(i)=ailcaix6 
enddo
cifi6(1)=ailcaix6 + ailcaix6 
cifi6(2)=ailcaix6 
cifi6(nx-2)=ailcaix6 
cifi6(nx-1)=ailcaix6 
cifi6(nx)=0. 
cici6(1)=1. 
cici6(2)=1. 
cici6(nx-2)=1. 
cici6(nx-1)=1. 
cici6(nx)=1. 
cibi6(1)=ailcaix6 
cibi6(2)=ailcaix6 
cibi6(nx-2)=ailcaix6 
cibi6(nx-1)=ailcaix6 + ailcaix6 
cibi6(nx)=0. 
do i=3,nx-3 
   cifi6(i)=ailcaix6 
   cici6(i)=1. 
   cibi6(i)=ailcaix6 
enddo
if (iord.eq.6) then 
alcaiy6=9./62. 
aciy6=(63./62.)/dy 
bciy6=(17./62.)/3./dy 
elseif (iord.eq.2) then
alcaiy6=0. 
aciy6=(1.)/dy 
bciy6=(0.)/3./dy 
endif
!
cfy6(1)=alcaiy6 
cfy6(2)=alcaiy6 
cfy6(nym-2)=alcaiy6 
cfy6(nym-1)=alcaiy6 
cfy6(nym)=0. 
if (ncly==0) ccy6(1)=2.  
if (ncly==1) ccy6(1)=1. + alcaiy6 
if (ncly==2) ccy6(1)=1. + alcaiy6
ccy6(2)=1. 
ccy6(nym-2)=1. 
ccy6(nym-1)=1. 
if (ncly==0) ccy6(nym)=1. + alcaiy6*alcaiy6  
if (ncly==1) ccy6(nym)=1. + alcaiy6 
if (ncly==2) ccy6(nym)=1. + alcaiy6
cby6(1)=alcaiy6 
cby6(2)=alcaiy6 
cby6(nym-2)=alcaiy6 
cby6(nym-1)=alcaiy6 
cby6(nym)=0. 
do j=3,nym-3 
   cfy6(j)=alcaiy6 
   ccy6(j)=1. 
   cby6(j)=alcaiy6 
enddo
cfi6y(1)=alcaiy6 + alcaiy6 
cfi6y(2)=alcaiy6 
cfi6y(ny-2)=alcaiy6 
cfi6y(ny-1)=alcaiy6 
cfi6y(ny)=0. 
cci6y(1)=1. 
cci6y(2)=1. 
cci6y(ny-2)=1. 
cci6y(ny-1)=1. 
cci6y(ny)=1. 
cbi6y(1)=alcaiy6 
cbi6y(2)=alcaiy6 
cbi6y(ny-2)=alcaiy6 
cbi6y(ny-1)=alcaiy6 + alcaiy6 
cbi6y(ny)=0. 
do j=3,ny-3 
   cfi6y(j)=alcaiy6 
   cci6y(j)=1. 
   cbi6y(j)=alcaiy6 
enddo
if (iord.eq.6) then
ailcaiy6=3./10.!0.49
aiciy6=1./128.*(75.+70.*ailcaiy6)!1./128.*(75.+70.*ailcaiy6)!1.749875/2.
biciy6=1./256.*(126.*ailcaiy6-25.)!1./256.*(126.*ailcaiy6-25.)!0.249925/2.
ciciy6=1./256.*(-10.*ailcaiy6+3.)!1./256.*(-10.*ailcaiy6+3.)!0.
elseif (iord.eq.2) then
ailcaiy6=0.
aiciy6=1.
biciy6=0.
 ciciy6=0.
endif
print *,'New coef Inter Y',aiciy6,biciy6,ciciy6
!aiciy6=3./4. 
!biciy6=1./20. 
cify6(1)=ailcaiy6 
cify6(2)=ailcaiy6 
cify6(nym-2)=ailcaiy6 
cify6(nym-1)=ailcaiy6 
cify6(nym)=0. 
if (ncly==0) cicy6(1)=2.  
if (ncly==1) cicy6(1)=1. + ailcaiy6 
if (ncly==2) cicy6(1)=1. + ailcaiy6 
cicy6(2)=1. 
cicy6(nym-2)=1. 
cicy6(nym-1)=1. 
if (ncly==0) cicy6(nym)=1. + ailcaiy6*ailcaiy6
if (ncly==1) cicy6(nym)=1. + ailcaiy6 
if (ncly==2) cicy6(nym)=1. + ailcaiy6
ciby6(1)=ailcaiy6 
ciby6(2)=ailcaiy6 
ciby6(nym-2)=ailcaiy6 
ciby6(nym-1)=ailcaiy6 
ciby6(nym)=0. 
do j=3,nym-3 
   cify6(j)=ailcaiy6 
   cicy6(j)=1. 
   ciby6(j)=ailcaiy6 
enddo
cifi6y(1)=ailcaiy6 + ailcaiy6 
cifi6y(2)=ailcaiy6 
cifi6y(ny-2)=ailcaiy6 
cifi6y(ny-1)=ailcaiy6 
cifi6y(ny)=0. 
cici6y(1)=1. 
cici6y(2)=1. 
cici6y(ny-2)=1. 
cici6y(ny-1)=1. 
cici6y(ny)=1. 
cibi6y(1)=ailcaiy6 
cibi6y(2)=ailcaiy6 
cibi6y(ny-2)=ailcaiy6 
cibi6y(ny-1)=ailcaiy6 + ailcaiy6 
cibi6y(ny)=0. 
do j=3,ny-3 
   cifi6y(j)=ailcaiy6 
   cici6y(j)=1. 
   cibi6y(j)=ailcaiy6 
enddo

if (nz.gt.1) then
if (iord.eq.6) then
   alcaiz6=9./62. 
   aciz6=(63./62.)/dz 
   bciz6=(17./62.)/3./dz 
elseif (iord.eq.2) then
   alcaiz6=0. 
   aciz6=(1.)/dz 
   bciz6=(0.)/3./dz 
endif   
   cfz6(1)=alcaiz6 
   cfz6(2)=alcaiz6 
   cfz6(nzm-2)=alcaiz6 
   cfz6(nzm-1)=alcaiz6 
   cfz6(nzm)=0. 
   if (nclz==0) ccz6(1)=2.  
   if (nclz==1) ccz6(1)=1. + alcaiz6 
   if (nclz==2) ccz6(1)=1. + alcaiz6
   ccz6(2)=1. 
   ccz6(nzm-2)=1. 
   ccz6(nzm-1)=1. 
   if (nclz==0) ccz6(nzm)=1. + alcaiz6*alcaiz6  
   if (nclz==1) ccz6(nzm)=1. + alcaiz6 
   if (nclz==2) ccz6(nzm)=1. + alcaiz6
   cbz6(1)=alcaiz6 
   cbz6(2)=alcaiz6 
   cbz6(nzm-2)=alcaiz6 
   cbz6(nzm-1)=alcaiz6 
   cbz6(nzm)=0. 
   do k=3,nzm-3 
      cfz6(k)=alcaiz6 
      ccz6(k)=1. 
      cbz6(k)=alcaiz6 
   enddo
   cfi6z(1)=alcaiz6 + alcaiz6 
   cfi6z(2)=alcaiz6 
   cfi6z(nz-2)=alcaiz6 
   cfi6z(nz-1)=alcaiz6 
   cfi6z(nz)=0. 
   cci6z(1)=1. 
   cci6z(2)=1. 
   cci6z(nz-2)=1. 
   cci6z(nz-1)=1. 
   cci6z(nz)=1. 
   cbi6z(1)=alcaiz6 
   cbi6z(2)=alcaiz6 
   cbi6z(nz-2)=alcaiz6 
   cbi6z(nz-1)=alcaiz6 + alcaiz6 
   cbi6z(nz)=0. 
   do k=3,nz-3 
      cfi6z(k)=alcaiz6 
      cci6z(k)=1. 
      cbi6z(k)=alcaiz6 
   enddo
if (iord.eq.6) then   
   ailcaiz6=3./10.!0.49
   aiciz6=1./128.*(75.+70.*ailcaiz6)!1./128.*(75.+70.*ailcaiz6)!1.749875/2.
   biciz6=1./256.*(126.*ailcaiz6-25.)!1./256.*(126.*ailcaiz6-25.)!0.249925/2.
   ciciz6=1./256.*(-10.*ailcaiz6+3.)!1./256.*(-10.*ailcaiz6+3.)!0.
elseif (iord.eq.2) then
   ailcaiz6=0.
   aiciz6=1.
   biciz6=0.
   ciciz6=0.
endif   
   print *,'New coef Inter Z',aiciz6,biciz6,ciciz6
   !aiciz6=3./4. 
   !biciz6=1./20. 
   cifz6(1)=ailcaiz6 
   cifz6(2)=ailcaiz6 
   cifz6(nzm-2)=ailcaiz6 
   cifz6(nzm-1)=ailcaiz6 
   cifz6(nzm)=0. 
   if (nclz==0) cicz6(1)=2.  
   if (nclz==1) cicz6(1)=1. + ailcaiz6 
   if (nclz==2) cicz6(1)=1. + ailcaiz6 
   cicz6(2)=1. 
   cicz6(nzm-2)=1. 
   cicz6(nzm-1)=1. 
   if (nclz==0) cicz6(nzm)=1. + ailcaiz6*ailcaiz6
   if (nclz==1) cicz6(nzm)=1. + ailcaiz6 
   if (nclz==2) cicz6(nzm)=1. + ailcaiz6
   cibz6(1)=ailcaiz6 
   cibz6(2)=ailcaiz6 
   cibz6(nzm-2)=ailcaiz6 
   cibz6(nzm-1)=ailcaiz6 
   cibz6(nzm)=0. 
   do k=3,nzm-3 
      cifz6(k)=ailcaiz6 
      cicz6(k)=1. 
      cibz6(k)=ailcaiz6 
   enddo
   cifi6z(1)=ailcaiz6 + ailcaiz6 
   cifi6z(2)=ailcaiz6 
   cifi6z(nz-2)=ailcaiz6 
   cifi6z(nz-1)=ailcaiz6 
   cifi6z(nz)=0. 
   cici6z(1)=1. 
   cici6z(2)=1. 
   cici6z(nz-2)=1. 
   cici6z(nz-1)=1. 
   cici6z(nz)=1. 
   cibi6z(1)=ailcaiz6 
   cibi6z(2)=ailcaiz6 
   cibi6z(nz-2)=ailcaiz6 
   cibi6z(nz-1)=ailcaiz6 + ailcaiz6 
   cibi6z(nz)=0. 
   do k=3,nz-3 
      cifi6z(k)=ailcaiz6 
      cici6z(k)=1. 
      cibi6z(k)=ailcaiz6 
   enddo
endif
     
if (nz.gt.1) then
   alfa1z= 2.
   af1z  =-(5./2.  )/dz
   bf1z  = (   2.  )/dz
   cf1z  = (1./2.  )/dz
   df1z  = 0.
   alfa2z= 1./4.
   af2z  = (3./4.  )/dz
   alfanz= 2.
   afnz  =-(5./2.  )/dz
   bfnz  = (   2.  )/dz
   cfnz  = (1./2.  )/dz
   dfnz  = 0.
   alfamz= 1./4.
   afmz  = (3./4.  )/dz
if (iord.eq.6) then    
   alfakz= 1./3.
   afkz  = (7./9.  )/dz
   bfkz  = (1./36. )/dz
elseif (iord.eq.2) then
   alfakz= 0.
   afkz  = (1.  )/dz
   bfkz  = (0. )/dz
endif   
   alsa1z= 11.
   as1z  = (13.    )/dz2
   bs1z  =-(27.    )/dz2
   cs1z  = (15.    )/dz2
   ds1z  =-(1.     )/dz2
   alsa2z= 1./10.
   as2z  = (6./5.  )/dz2
   alsanz= 11.
   asnz  = (13.    )/dz2
   bsnz  =-(27.    )/dz2
   csnz  = (15.    )/dz2
   dsnz  =-(1.     )/dz2
   alsamz= 1./10.
   asmz  = (6./5.  )/dz2
if (iord.eq.6) then   
         as3z  = (12./11.)/dz2
         bs3z  = (3./44. )/dz2
         astz  = (12./11.)/dz2
         bstz  = (3./44. )/dz2
!   alsakz= 2./11.
!   askz  = (12./11.)/dz2
!   bskz  = (3./44. )/dz2
         alsakz=(45.*fpi2*pi*pi-272.)/(2.*(45.*fpi2*pi*pi-208.))
         askz  =((6.-9.*alsakz)/4.)/dz2
         bskz  =((-3.+24*alsakz)/5.)/(4.*dz2)
         cskz  =((2.-11.*alsakz)/20.)/(9.*dz2)
elseif (iord.eq.2) then
         as3z  = (1.)/dz2
         bs3z  = (0. )/dz2
         astz  = (1.)/dz2
         bstz  = (0. )/dz2
   alsakz= 0.
   askz  = (1.)/dz2
   bskz  = (0.)/dz2
   cskz  =(0.)/(9.*dz2)
endif         
#if DEBUG
         write(*,*) '=== derzz ==='
         write(*,*) alsakz
         write(*,*) askz*dz2
         write(*,*) bskz*4*dz2
         write(*,*) cskz*9*dz2
         write(*,*) '============='
#endif
endif

if (nclx.eq.0) then
   ffx(1)   =alfaix
   ffx(2)   =alfaix
   ffx(nx-2)=alfaix
   ffx(nx-1)=alfaix
   ffx(nx)  =0.
   fcx(1)   =2.
   fcx(2)   =1.
   fcx(nx-2)=1.
   fcx(nx-1)=1.
   fcx(nx  )=1.+alfaix*alfaix
   fbx(1)   =alfaix
   fbx(2)   =alfaix
   fbx(nx-2)=alfaix
   fbx(nx-1)=alfaix
   fbx(nx  )=0.
   do i=3,nx-3
      ffx(i)=alfaix
      fcx(i)=1.
      fbx(i)=alfaix
   enddo
endif

if (nclx.eq.1) then
   ffx(1)   =alfaix+alfaix
   ffx(2)   =alfaix
   ffx(nx-2)=alfaix
   ffx(nx-1)=alfaix
   ffx(nx)  =0.
   fcx(1)   =1.
   fcx(2)   =1.
   fcx(nx-2)=1.
   fcx(nx-1)=1.
   fcx(nx  )=1.
   fbx(1)   =alfaix 
   fbx(2)   =alfaix
   fbx(nx-2)=alfaix
   fbx(nx-1)=alfaix+alfaix
   fbx(nx  )=0.
   do i=3,nx-3
      ffx(i)=alfaix
      fcx(i)=1.
      fbx(i)=alfaix
   enddo
endif

if (nclx.eq.2) then
   ffx(1)   =alfa1x
   ffx(2)   =alfa2x
   ffx(nx-2)=alfaix
   ffx(nx-1)=alfamx
   ffx(nx)  =0.
   fcx(1)   =1.
   fcx(2)   =1.
   fcx(nx-2)=1.
   fcx(nx-1)=1.
   fcx(nx  )=1.
   fbx(1)   =alfa2x 
   fbx(2)   =alfaix
   fbx(nx-2)=alfamx
   fbx(nx-1)=alfanx
   fbx(nx  )=0.
   do i=3,nx-3
      ffx(i)=alfaix
      fcx(i)=1.
      fbx(i)=alfaix
   enddo
endif

if (ncly.eq.0) then
   ffy(1)   =alfajy
   ffy(2)   =alfajy
   ffy(ny-2)=alfajy
   ffy(ny-1)=alfajy
   ffy(ny)  =0.
   fcy(1)   =2.
   fcy(2)   =1.
   fcy(ny-2)=1.
   fcy(ny-1)=1.
   fcy(ny  )=1.+alfajy*alfajy
   fby(1)   =alfajy
   fby(2)   =alfajy
   fby(ny-2)=alfajy
   fby(ny-1)=alfajy
   fby(ny  )=0.
   do j=3,ny-3
      ffy(j)=alfajy
      fcy(j)=1.
      fby(j)=alfajy
   enddo
endif

if (ncly.eq.1) then
   ffy(1)   =alfajy+alfajy
   ffy(2)   =alfajy
   ffy(ny-2)=alfajy
   ffy(ny-1)=alfajy
   ffy(ny)  =0.
   fcy(1)   =1.
   fcy(2)   =1.
   fcy(ny-2)=1.
   fcy(ny-1)=1.
   fcy(ny  )=1.
   fby(1)   =alfajy 
   fby(2)   =alfajy
   fby(ny-2)=alfajy
   fby(ny-1)=alfajy+alfajy
   fby(ny  )=0.
   do j=3,ny-3
      ffy(j)=alfajy
      fcy(j)=1.
      fby(j)=alfajy
   enddo
endif

if (ncly.eq.2) then
   ffy(1)   =alfa1y
   ffy(2)   =alfa2y
   ffy(ny-2)=alfajy
   ffy(ny-1)=alfamy
   ffy(ny)  =0.
   fcy(1)   =1.
   fcy(2)   =1.
   fcy(ny-2)=1.
   fcy(ny-1)=1.
   fcy(ny  )=1.
   fby(1)   =alfa2y 
   fby(2)   =alfajy
   fby(ny-2)=alfamy
   fby(ny-1)=alfany
   fby(ny  )=0.
   do j=3,ny-3
      ffy(j)=alfajy
      fcy(j)=1.
      fby(j)=alfajy
   enddo
endif

if (nz.gt.1) then
   if (nclz.eq.0) then
      ffz(1)   =alfakz
      ffz(2)   =alfakz
      ffz(nz-2)=alfakz
      ffz(nz-1)=alfakz
      ffz(nz)  =0.
      fcz(1)   =2.
      fcz(2)   =1.
      fcz(nz-2)=1.
      fcz(nz-1)=1.
      fcz(nz  )=1.+alfakz*alfakz
      fbz(1)   =alfakz
      fbz(2)   =alfakz
      fbz(nz-2)=alfakz
      fbz(nz-1)=alfakz
      fbz(nz  )=0.
      do k=3,nz-3
         ffz(k)=alfakz
         fcz(k)=1.
         fbz(k)=alfakz
      enddo
   endif

   if (nclz.eq.1) then
      ffz(1)   =alfakz+alfakz
      ffz(2)   =alfakz
      ffz(nz-2)=alfakz
      ffz(nz-1)=alfakz
      ffz(nz)  =0.
      fcz(1)   =1.
      fcz(2)   =1.
      fcz(nz-2)=1.
      fcz(nz-1)=1.
      fcz(nz  )=1.
      fbz(1)   =alfakz 
      fbz(2)   =alfakz
      fbz(nz-2)=alfakz
      fbz(nz-1)=alfakz+alfakz
      fbz(nz  )=0.
      do k=3,nz-3
         ffz(k)=alfakz
         fcz(k)=1.
         fbz(k)=alfakz
      enddo
   endif

   if (nclz.eq.2) then
      ffz(1)   =alfa1z
      ffz(2)   =alfa2z
      ffz(nz-2)=alfakz
      ffz(nz-1)=alfamz
      ffz(nz)  =0.
      fcz(1)   =1.
      fcz(2)   =1.
      fcz(nz-2)=1.
      fcz(nz-1)=1.
      fcz(nz  )=1.
      fbz(1)   =alfa2z 
      fbz(2)   =alfakz
      fbz(nz-2)=alfamz
      fbz(nz-1)=alfanz
      fbz(nz  )=0.
      do k=3,nz-3
         ffz(k)=alfakz
         fcz(k)=1.
         fbz(k)=alfakz
      enddo
   endif
endif

if (nclx.eq.0) then
   sfx(1)   =alsaix
   sfx(2)   =alsaix
   sfx(nx-2)=alsaix
   sfx(nx-1)=alsaix
   sfx(nx)  =0.
   scx(1)   =2.
   scx(2)   =1.
   scx(nx-2)=1.
   scx(nx-1)=1.
   scx(nx  )=1.+alsaix*alsaix
   sbx(1)   =alsaix
   sbx(2)   =alsaix
   sbx(nx-2)=alsaix
   sbx(nx-1)=alsaix
   sbx(nx  )=0.
   do i=3,nx-3
      sfx(i)=alsaix
      scx(i)=1.
      sbx(i)=alsaix
   enddo
endif

if (nclx.eq.1) then
   sfx(1)   =alsaix+alsaix
   sfx(2)   =alsaix
   sfx(nx-2)=alsaix
   sfx(nx-1)=alsaix
   sfx(nx)  =0.
   scx(1)   =1.
   scx(2)   =1.
   scx(nx-2)=1.
   scx(nx-1)=1.
   scx(nx  )=1.
   sbx(1)   =alsaix
   sbx(2)   =alsaix
   sbx(nx-2)=alsaix
   sbx(nx-1)=alsaix+alsaix
   sbx(nx  )=0.
   do i=3,nx-3
      sfx(i)=alsaix
      scx(i)=1.
      sbx(i)=alsaix
   enddo
endif

if (nclx.eq.2) then
   sfx(1)   =alsa1x
   sfx(2)   =alsa2x
   sfx(nx-2)=alsaix
   sfx(nx-1)=alsamx
   sfx(nx)  =0.
   scx(1)   =1.
   scx(2)   =1.
   scx(nx-2)=1.
   scx(nx-1)=1.
   scx(nx  )=1.
   sbx(1)   =alsa2x 
   sbx(2)   =alsaix
   sbx(nx-2)=alsamx
   sbx(nx-1)=alsanx
   sbx(nx  )=0.
   do i=3,nx-3
      sfx(i)=alsaix
      scx(i)=1.
      sbx(i)=alsaix
   enddo
endif

if (ncly.eq.0) then
   sfy(1)   =alsajy
   sfy(2)   =alsajy
   sfy(ny-2)=alsajy
   sfy(ny-1)=alsajy
   sfy(ny)  =0.
   scy(1)   =2.
   scy(2)   =1.
   scy(ny-2)=1.
   scy(ny-1)=1.
   scy(ny  )=1.+alsajy*alsajy
   sby(1)   =alsajy
   sby(2)   =alsajy
   sby(ny-2)=alsajy
   sby(ny-1)=alsajy
   sby(ny  )=0.
   do j=3,ny-3
      sfy(j)=alsajy
      scy(j)=1.
      sby(j)=alsajy
   enddo
endif

if (ncly.eq.1) then
   sfy(1)   =alsajy+alsajy
   sfy(2)   =alsajy
   sfy(ny-2)=alsajy
   sfy(ny-1)=alsajy
   sfy(ny)  =0.
   scy(1)   =1.
   scy(2)   =1.
   scy(ny-2)=1.
   scy(ny-1)=1.
   scy(ny  )=1.
   sby(1)   =alsajy 
   sby(2)   =alsajy
   sby(ny-2)=alsajy
   sby(ny-1)=alsajy+alsajy
   sby(ny  )=0.
   do j=3,ny-3
      sfy(j)=alsajy
      scy(j)=1.
      sby(j)=alsajy
   enddo
endif

if (ncly.eq.2) then
   sfy(1)   =alsa1y
   sfy(2)   =alsa2y
   sfy(ny-2)=alsajy
   sfy(ny-1)=alsamy
   sfy(ny)  =0.
   scy(1)   =1.
   scy(2)   =1.
   scy(ny-2)=1.
   scy(ny-1)=1.
   scy(ny  )=1.
   sby(1)   =alsa2y 
   sby(2)   =alsajy
   sby(ny-2)=alsamy
   sby(ny-1)=alsany
   sby(ny  )=0.
   do j=3,ny-3
      sfy(j)=alsajy
      scy(j)=1.
      sby(j)=alsajy
   enddo
endif

if (nz.gt.1) then
   if (nclz.eq.0) then
      sfz(1)   =alsakz
      sfz(2)   =alsakz
      sfz(nz-2)=alsakz
      sfz(nz-1)=alsakz
      sfz(nz)  =0.
      scz(1)   =2.
      scz(2)   =1.
      scz(nz-2)=1.
      scz(nz-1)=1.
      scz(nz  )=1.+alsakz*alsakz
      sbz(1)   =alsakz
      sbz(2)   =alsakz
      sbz(nz-2)=alsakz
      sbz(nz-1)=alsakz
      sbz(nz  )=0.
      do k=3,nz-3
         sfz(k)=alsakz
         scz(k)=1.
         sbz(k)=alsakz
      enddo
   endif

   if (nclz.eq.1) then
      sfz(1)   =alsakz+alsakz
      sfz(2)   =alsakz
      sfz(nz-2)=alsakz
      sfz(nz-1)=alsakz
      sfz(nz)  =0.
      scz(1)   =1.
      scz(2)   =1.
      scz(nz-2)=1.
      scz(nz-1)=1.
      scz(nz  )=1.
      sbz(1)   =alsakz 
      sbz(2)   =alsakz
      sbz(nz-2)=alsakz
      sbz(nz-1)=alsakz+alsakz
      sbz(nz  )=0.
      do k=3,nz-3
         sfz(k)=alsakz
         scz(k)=1.
         sbz(k)=alsakz
      enddo
   endif
   
   if (nclz.eq.2) then
      sfz(1)   =alsa1z
      sfz(2)   =alsa2z
      sfz(nz-2)=alsakz
      sfz(nz-1)=alsamz
      sfz(nz)  =0.
      scz(1)   =1.
      scz(2)   =1.
      scz(nz-2)=1.
      scz(nz-1)=1.
      scz(nz  )=1.
      sbz(1)   =alsa2z 
      sbz(2)   =alsakz
      sbz(nz-2)=alsamz
      sbz(nz-1)=alsanz
      sbz(nz  )=0.
      do k=3,nz-3
         sfz(k)=alsakz
         scz(k)=1.
         sbz(k)=alsakz
      enddo
   endif
endif

do i=1,nx
   ffxp(i)=ffx(i)
   sfxp(i)=sfx(i)
enddo
do i=1,nxm   
   cfxp6(i)=cfx6(i)
   cifxp6(i)=cifx6(i)
enddo
do i=1,nx
   cifip6(i)=cifi6(i)
   cfip6(i)=cfi6(i)
enddo
do j=1,ny
   ffyp(j)=ffy(j)
   sfyp(j)=sfy(j)
enddo
do j=1,nym
   cfyp6(j)=cfy6(j)
   cifyp6(j)=cify6(j)
enddo
do j=1,ny
   cifip6y(j)=cifi6y(j)
   cfip6y(j)=cfi6y(j)
enddo

if (nz.gt.1) then
   do k=1,nz
      ffzp(k)=ffz(k)
      sfzp(k)=sfz(k)
   enddo
   do k=1,nzm
      cfzp6(k)=cfz6(k)
      cifzp6(k)=cifz6(k)
   enddo
   do k=1,nz
      cifip6z(k)=cifi6z(k)
      cfip6z(k)=cfi6z(k)
   enddo
endif

if (nclx.eq.1) then
   ffxp(1)=0.
   sfx (1)=0.
endif
if (ncly.eq.1) then
   ffyp(1)=0.
   sfy (1)=0.
endif
cfxp6(1)=0.
cfip6(1)=0.
cfyp6(1)=0.
cfip6y(1)=0.

if (nz.gt.1) then
   if (nclz.eq.1) then
      ffzp(1)=0.
      sfz (1)=0.
   endif
   cfzp6(1)=0.
   cfip6z(1)=0.
endif
   
call prepare (fbx,fcx,ffx ,fsx ,fwx ,nx)
call prepare (fbx,fcx,ffxp,fsxp,fwxp,nx)
call prepare (fby,fcy,ffy ,fsy ,fwy ,ny)
call prepare (fby,fcy,ffyp,fsyp,fwyp,ny)
call prepare (cbx6,ccx6,cfx6 ,csx6 ,cwx6 ,nxm)
call prepare (cbx6,ccx6,cfxp6,csxp6,cwxp6,nxm)
call prepare (cibx6,cicx6,cifx6 ,cisx6 ,ciwx6 ,nxm)
call prepare (cibx6,cicx6,cifxp6,cisxp6,ciwxp6,nxm)
call prepare (cbi6,cci6,cfi6 ,csi6 ,cwi6 ,nx)
call prepare (cbi6,cci6,cfip6,csip6,cwip6,nx)
call prepare (cibi6,cici6,cifi6 ,cisi6 ,ciwi6 ,nx)
call prepare (cibi6,cici6,cifip6,cisip6,ciwip6,nx)
call prepare (cby6,ccy6,cfy6 ,csy6 ,cwy6 ,nym)
call prepare (cby6,ccy6,cfyp6,csyp6,cwyp6,nym)
call prepare (ciby6,cicy6,cify6 ,cisy6 ,ciwy6 ,nym)
call prepare (ciby6,cicy6,cifyp6,cisyp6,ciwyp6,nym)
call prepare (cbi6y,cci6y,cfi6y ,csi6y ,cwi6y ,ny)
call prepare (cbi6y,cci6y,cfip6y,csip6y,cwip6y,ny)
call prepare (cibi6y,cici6y,cifi6y ,cisi6y ,ciwi6y ,ny)
call prepare (cibi6y,cici6y,cifip6y,cisip6y,ciwip6y,ny)

if (nz.gt.1) then
   call prepare (fbz,fcz,ffz ,fsz ,fwz ,nz)
   call prepare (fbz,fcz,ffzp,fszp,fwzp,nz)
   call prepare (cbz6,ccz6,cfz6 ,csz6 ,cwz6 ,nzm)
   call prepare (cbz6,ccz6,cfzp6,cszp6,cwzp6,nzm)
   call prepare (cibz6,cicz6,cifz6 ,cisz6 ,ciwz6 ,nzm)
   call prepare (cibz6,cicz6,cifzp6,ciszp6,ciwzp6,nzm)
   call prepare (cbi6z,cci6z,cfi6z ,csi6z ,cwi6z ,nz)
   call prepare (cbi6z,cci6z,cfip6z,csip6z,cwip6z,nz)
   call prepare (cibi6z,cici6z,cifi6z ,cisi6z ,ciwi6z ,nz)
   call prepare (cibi6z,cici6z,cifip6z,cisip6z,ciwip6z,nz)
endif

if (nclx.eq.1) then
   fbx(nx-1)=0.
   call prepare (fbx,fcx,ffxp,fsxp,fwxp,nx)
   cbx6(nxm-1)=0.
   cibx6(nxm)=0
   cbi6(nx-1)=0.
   cibi6(nx)=0
   call prepare (cbx6,ccx6,cfxp6,csxp6,cwxp6,nxm)
   call prepare (cibx6,cicx6,cifxp6,cisxp6,ciwxp6,nxm)
   call prepare (cbi6,cci6,cfip6,csip6,cwip6,nx)
   call prepare (cibi6,cici6,cifip6,cisip6,ciwip6,nx)
endif
if (nclx.eq.2) then
   cbx6(nxm-1)=0.
   cibx6(nxm)=0.
   cbi6(nx-1)=0.
   cibi6(nx)=0.
   call prepare (cbx6,ccx6,cfxp6,csxp6,cwxp6,nxm)
   call prepare (cibx6,cicx6,cifxp6,cisxp6,ciwxp6,nxm)
   call prepare (cbi6,cci6,cfip6,csip6,cwip6,nx)
   call prepare (cibi6,cici6,cifip6,cisip6,ciwip6,nx)
endif
if (ncly.eq.1) then
   fby(ny-1)=0.
   call prepare (fby,fcy,ffyp,fsyp,fwyp,ny)
   cby6(nym-1)=0.
   ciby6(nym)=0.
   cbi6y(ny-1)=0.
   cibi6y(ny)=0. 
   call prepare (cby6,ccy6,cfyp6,csyp6,cwyp6,nym)
   call prepare (ciby6,cicy6,cifyp6,cisyp6,ciwyp6,nym)
   call prepare (cbi6y,cci6y,cfip6y,csip6y,cwip6y,ny)
   call prepare (cibi6y,cici6y,cifip6y,cisip6y,ciwip6y,ny)
endif
if (ncly.eq.2) then
   cby6(nym-1)=0.
   ciby6(nym)=0
   cbi6y(ny-1)=0.
   cibi6y(ny)=0
   call prepare (cby6,ccy6,cfyp6,csyp6,cwyp6,nym)
   call prepare (ciby6,cicy6,cifyp6,cisyp6,ciwyp6,nym)
   call prepare (cbi6y,cci6y,cfip6y,csip6y,cwip6y,ny)
   call prepare (cibi6y,cici6y,cifip6y,cisip6y,ciwip6y,ny)
endif

if (nz.gt.1) then
   if (nclz.eq.1) then
      fbz(nz-1)=0.
      call prepare (fbz,fcz,ffzp,fszp,fwzp,nz)
      cbz6(nzm-1)=0.
      cibz6(nzm)=0.
      cbi6z(nz-1)=0.
      cibi6z(nz)=0. 
      call prepare (cbz6,ccz6,cfzp6,cszp6,cwzp6,nzm)
      call prepare (cibz6,cicz6,cifzp6,ciszp6,ciwzp6,nzm)
      call prepare (cbi6z,cci6z,cfip6z,csip6z,cwip6z,nz)
      call prepare (cibi6z,cici6z,cifip6z,cisip6z,ciwip6z,nz)
   endif
   if (nclz.eq.2) then
      cbz6(nzm-1)=0.
      cibz6(nzm)=0.
      cbi6z(nz-1)=0.
      cibi6z(nz)=0.   
      call prepare (cbz6,ccz6,cfzp6,cszp6,cwzp6,nzm)
      call prepare (cibz6,cicz6,cifzp6,ciszp6,ciwzp6,nzm)
      call prepare (cbi6z,cci6z,cfip6z,csip6z,cwip6z,nz)
      call prepare (cibi6z,cici6z,cifip6z,cisip6z,ciwip6z,nz)
   endif
endif

call prepare (sbx,scx,sfx,ssx,swx,nx)
call prepare (sby,scy,sfy,ssy,swy,ny)
if (nz.gt.1) call prepare (sbz,scz,sfz,ssz,swz,nz)

call prepare (sbx,scx,sfxp,ssxp,swxp,nx)
call prepare (sby,scy,sfyp,ssyp,swyp,ny)
if (nz.gt.1) call prepare (sbz,scz,sfzp,sszp,swzp,nz)

if (nclx.eq.1) then
   sbx(nx-1)=0.
   call prepare (sbx,scx,sfx ,ssx ,swx ,nx)
endif
if (ncly.eq.1) then
   sby(ny-1)=0.
   call prepare (sby,scy,sfy ,ssy ,swy ,ny)
endif
if (nclz.eq.1) then
   sbz(nz-1)=0.
   call prepare (sbz,scz,sfz ,ssz ,swz ,nz)
endif

return
end subroutine schemas

!*******************************************************************
!
subroutine prepare (b,c,f,s,w,n)
! 
!*******************************************************************

implicit none

integer :: i,n
real(8),dimension(n) :: b,c,f,s,w

do i=1,n
   w(i)=c(i)
enddo
do i=2,n
   s(i)=b(i-1)/w(i-1)
   w(i)=w(i)-f(i-1)*s(i)
enddo
do i=1,n
   w(i)=1./w(i)    
enddo

return
end subroutine prepare
