tvmnpv(n,i,cf0,cfall)=-(cf0+sum(cfall./(1+i).^n))
tvmpmt(n,i,pv)=-(i*pv)/(1-(1+i)^-n)
tvmpv(n,i,pmt)=-sum(pmt.*(1+i).^(-n))
tvmfv(n,i,pmt)=-sum(pmt./(1+i).^(-n+1))
