
function atkinson(trueW,n,m,A)

	# This function calculates assignments of n-th patient according to SMITH BCD method [1984b]
    # It returns vector of assignments x_{np}, for p=1..m
    
    # m=2 always

    # n - time stage
    # trueW - vector of patients` properties (only the first n components will be used)
    # m - number of the groups
    # A - Nxm matrix of previous assignemnts (we will use only the first n-1 rows)
    
    # We assume that 
    # 1) trueW are 1-dimensional i.i.d. standard normal (S=1)
    
    x=0
    for i=1:n-1
        if A[i,1]>0.9
            x+=trueW[i]
        else
            x-=trueW[i]
        end
    end
    x/=norm(trueW[1:n-1])^2
    x*=trueW[n]
        
    phi=(1-x)^2/((1-x)^2+(1+x)^2)
#    println("phi: ", phi)
    
    y=zeros(m) # binary assignment variables
    
    xx=rand() # toss a coin
    if xx<phi
        y[1]=1
    else
        y[2]=1
    end
    return y

end

