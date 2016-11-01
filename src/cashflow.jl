module Cashflows

export tvmnpv, tvmpmt, tvmpv, tvmfv, cfnoi

# Basic TVM Functions
tvmnpv(i,cfo,cfall)=begin
	n=collect(1:length(cfall));
	cfo + sum(cfall./(1+i).^n)
	end
tvmpmt(n,i,pv)=-(i*pv)/(1-(1+i)^-n)
tvmpv(n,i,pmt)=-sum(pmt.*(1+i).^(-n))
tvmfv(n,i,pv,pmt)= begin
	n=collect(1:n)
	p=length(n)
	pv*(1+i)^p-sum(-pmt./(1+i).^(-n+1))
	end

# Operating Statement
cfnoi(pgi,vcr,oexr,capexr)=pgi-pgi.*vcr-(pgi-pgi.*vcr)*oexr-(pgi-pgi.*vcr)*capexr

importall Cashflows

end # module
