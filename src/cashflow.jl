module Cashflows

using Roots

export tvmnpv, tvmpmt, tvmpv, tvmfv, tvmirr, returns

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

tvmirr(cfo,cfall)=begin
	f(x)=tvmnpv(x,cfo,cfall)
	fzero(f,[0.0,1.0])
	end

returns(a)=begin
	b=[a[n] for n=1:length(a)-1]
	diff(a)./b
	end



importall Cashflows

end # module
