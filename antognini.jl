
function antognini(trueW,n,m,A,thresholds)

	# This function calculates assignments of n-th patient according to C-ABCD(F^a) method
    # It returns vector of assignments x_{np}, for p=1..m
    
    # m=2 always

    # n - time stage
    # trueW - vector of patients` properties (only the first n components will be used)
    # m - number of the groups
    # A - Nxm matrix of previous assignemnts (we will use only the first n-1 rows)
    # thresholds - sorted vector of size J-1 with points that split R into J levels
    # thresholds = [-2,-1,0,1,2]
    
    # We assume that 
    # 1) trueW are 1-dimensional i.i.d. N(0,10)
    # 2) 6 levels of covariate stratification with thresholds: thresholds=[-2, -1, 0, 1, 2] (J=6)
    
    # J - Number of levels for covariate
    J=size(thresholds,1)+1
    
    NN=zeros(J,2) # Number of elements in level j=1...J and group m=1,2.
    
    for i=1:n-1
        for j=1:J-1
            if trueW[i]<thresholds[j]
                if A[i,1]>0.9
                    NN[j,1]+=1
                else
                    NN[j,2]+=1
                end
                break
            end
        end
        if trueW[i]>=thresholds[J-1]
            if A[i,1]>0.9
                NN[J,1]+=1
            else
                NN[J,2]+=1
            end
        end
    end
    
    # Current level NN_cur, level of covariate trueW[n]
    NN_cur=1
    for j=1:J-1
        if trueW[n]<thresholds[j]
            NN_cur=j
            break
        end
        NN_cur=J
    end
    
    # Difference D_i(n)
    D=0
    D=NN[NN_cur,1]-NN[NN_cur,2]
    
    a=J-1 # exponent in function F^a(D)
    
    phi=0 # Baised Coin Probability
    if D>=0 && D<=1
        phi=0.5
    elseif D>1
        phi=(D^a+1)^(-1)
    else
        phi=1-((-D)^a+1)^(-1)        
    end
#    println("phi: ", phi)
    
    y=zeros(m) # binary assignment variables
    
    x=rand() # toss a coin
    if x<phi
        y[1]=1
    else
        y[2]=1
    end
    return y

end

