module Cashflows
using Roots
export tvmnpv, tvmpmt, tvmpv, tvmfv,tvmirr,returns

# Basic TVM Functions
tvmnpv(i,cfo,cfall)= begin
		n=collect(1:length(cfall));
		cfo + sum(cfall./(1+i).^n)
end
tvmpmt(n,i,pv)=-(i*pv)/(1-(1+i)^-n)

tvmpv(n,i,pmt,fv,a)= begin
	if a==0
		n=collect(1:n-1)
		cfall=append!(fill(pmt,n[end]-1),[fv+pmt])
		-(pmt+sum(cfall./(1+i).^n))
	elseif a==1
		n=collect(1:n)
		cfall=append!(fill(pmt,n[end]-1),[fv+pmt]);
		-(sum(cfall./(1+i).^n))
	end
	end


tvmfv(n,i,pv,pmt)= begin
	n=collect(1:n)
	p=length(n)
	pv*(1+i)^p-sum(-pmt./(1+i).^(-n+1))
	end
returns(a)=begin
	b=[a[n] for n=1:length(a)-1]
	diff(a)./b
	end

tvmirr(cfo,cfall)=begin
	f(x)=tvmnpv(x,cfo,cfall)
	fzero(f,[0.0,1.0])
	end




importall Cashflows

end # module
