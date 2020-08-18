%% From lab code with spatial grid addition

function H=ComputeRGBHistogram(img,Q)

%qimg=double(img)./256;
img=floor(img.*Q);

red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);

bin = red*Q^2 + blue*Q^1 + green;

vals=reshape(bin,1,size(bin,1)*size(bin,2));

H=hist(vals,Q^3);

H=H ./sum(H);


return;