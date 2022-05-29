# AEC, Acoustic Echo Cancellation

## Table of contents
* [Overall Architecture](#overall-architecture)
* [Input](#input)
* [Problem Setting](#problem-setting)
* [LMS](#lms)
* [NLMS](#nlms)
* [RLS](#rls)


## Overall architecture
The following architecture defines the Acho Problem

<img src="https://user-images.githubusercontent.com/67786803/170850023-60cb58f9-e699-489b-8d58-b726073ad3c2.png"
     width="900" height="284">

 ### :gear: Software & Tools
<p align="left">
&emsp;
<a target="_blank" href="https://www.mathworks.com/products/matlab.html "><img src="https://user-images.githubusercontent.com/67786803/170850111-8b59588e-d841-47fa-8dcc-8848683ea760.png?style=for-the-badge&logo=git&logoColor=white"  width="140" height="127"></img></a></p>

##  

## Input
  - Source Singal, S(n) 
<p align="center">
&emsp;
<img src="https://user-images.githubusercontent.com/67786803/170850308-40908f62-3d9d-4211-9879-ec975f0fba04.png"  width="700" height="293"></img></p>

  - Reference Signal, U(n)
    - Laplacian white noise
<p align="center">
&emsp;
<img src="https://user-images.githubusercontent.com/67786803/170850439-6c5461bf-771a-469c-99c3-59b358f247c0.png"  width="700" height="293"></img></p>    
    - Speech signal 
<p align="center">
&emsp;
<img src="https://user-images.githubusercontent.com/67786803/170850492-3c21ce8d-05a5-4297-a682-bac317d2b807.png"  width="700" height="293"></img></p>

## Problem Setting 
> n : discrete time, n=0, 1, 2, ...

> s(n) : source signal

> u(n) : reference signal

> d(n) : primary input signal
  
<p align="left">
&emsp;
<img src="https://user-images.githubusercontent.com/67786803/170850698-10975cbe-b1d3-4c27-b1f8-3faa657f6910.png"  width="70%" height="70%"></img></p>

> w(n) : adaptive filter coefficient

> y(n) : filter ouotput signal
<p align="left">
&emsp;
<img src="https://user-images.githubusercontent.com/67786803/170850781-b90cd084-d4ee-48e6-8ea9-9457eab3ad34.png"  width="28%" height="28%"></img></p>

> e(n) : error
<p align="left">
&emsp;
<img src="https://user-images.githubusercontent.com/67786803/170850816-dba8dc91-44fe-41af-8542-951d22692876.png"  width="23%" height="23%"></img></p>


## LMS
### Filter 1
- Laplacian white Nosie 
<p align="center">
&emsp;
<img src="https://user-images.githubusercontent.com/67786803/170851472-084bdb5b-efeb-4899-b47f-06f87a07700d.png"  width="700" height="223"></img></p>    
  
  - Speech signal
<p align="center">
&emsp;
<img src="https://user-images.githubusercontent.com/67786803/170851487-128458fe-7516-433c-b718-c843dabd05f5.png"  width="700" height="223"></img></p>    

### Filter 2
- Laplacian white Nosie 
<p align="center">
&emsp;
<img src="https://user-images.githubusercontent.com/67786803/170852013-10355a5c-2c8c-4bc0-a6ac-aadad620647b.png"  width="700" height="223"></img></p>    

  - Speech signal
<p align="center">
&emsp;
<img src="https://user-images.githubusercontent.com/67786803/170852025-6f44f320-f162-42dd-8021-a93791a1bf15.png"  width="700" height="223"></img></p>    

## NLMS
### Filter 1
- Laplacian white Nosie 
<p align="center">
&emsp;
<img src="https://user-images.githubusercontent.com/67786803/170893518-caedada6-2971-403c-9ef6-9d4bafc02872.png"  width="700" height="223"></img></p>    
  
  - Speech signal
<p align="center">
&emsp;
<img src="https://user-images.githubusercontent.com/67786803/170893526-1bbee107-fae3-46cb-9442-ce82ddf717d5.png"  width="700" height="223"></img></p>    

### Filter 2
- Laplacian white Nosie 
<p align="center">
&emsp;
<img src="https://user-images.githubusercontent.com/67786803/170893543-64ff49dd-53b4-498c-b797-1e6e5727fb3d.png"  width="700" height="223"></img></p>    

  - Speech signal
<p align="center">
&emsp;
<img src="https://user-images.githubusercontent.com/67786803/170893549-56206dd1-7955-4762-baac-136a81a5944a.png"  width="700" height="223"></img></p>    

