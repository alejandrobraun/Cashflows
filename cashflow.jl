module Cashflows

export tvmnpv, tvmpmt, tvmpv, tvmfv, cfnoi

# Basic TVM Functions
tvmnpv(n,i,cf0,cfall)=-(cf0+sum(cfall./(1+i).^n))
tvmpmt(n,i,pv)=-(i*pv)/(1-(1+i)^-n)
tvmpv(n,i,pmt)=-sum(pmt.*(1+i).^(-n))
tvmfv(n,i,pmt)=-sum(pmt./(1+i).^(-n+1))

# Operating Statement
cfnoi(pgi,vcr,oexr,capexr)=pgi-pgi.*vcr-(pgi-pgi.*vcr)*oexr-(pgi-pgi.*vcr)*capexr

importall Cashflows

end # module
