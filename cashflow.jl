tvmnpv(n,i,cf0,cfall)=-(cf0+sum(cfall./(1+i).^n))
tvmpmt(n,i,pv)=-(i*pv)/(1-(1+i)^-n)
tvmpv(n,i,pmt)=-sum(pmt.*(1+i).^(-n))
## tvmpv can also be sum(pmt./(1+r).^(p))
tvmfv(n,i,pmt)=-sum(pmt./(1+i).^(-n+1))
## for tvmfv, there is -n+1 because the last cashflow happens at the time of the fv
## tvmfv can also be sum(pmt.*(1+i).^(n-1))


