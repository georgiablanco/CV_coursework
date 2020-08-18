function [E, e_val, e_vec]=image_PCA(ALLFEAT)

    N = size(ALLFEAT,1);
    D = size(ALLFEAT,2);
    m_ALLFEAT = mean(ALLFEAT);

    sub_m = ALLFEAT - repmat(m_ALLFEAT,N,1);
    
    C=(1/(size(ALLFEAT,2))) * (sub_m' * sub_m);

    [U, V]=eig(C);
    
    % sort eigenvectors and eigenvalues by eigenvalue size (desc)
    linV=V*ones(size(V,2),1);
    S=[linV U'];
    S=flipud(sortrows(S,1));
    U=S(:,2:end)';
    V=S(:,1);
    
    e_vec=U;
    e_val=V;
    
    deflate = 10;
    
    e_val=e_val(1:deflate);
    e_vec=e_vec(:,1:deflate);
    
    ALLFEAT = ALLFEAT-repmat(size(m_ALLFEAT,1),1);
    E = (e_vec'*ALLFEAT')';
   
return


    