function F = ComputeSpatialTextureColour(img, row, col)
    Gx = [1 2 1; 0 0 0; -1 -2 -1]; 
    Gy = Gx';

    gray_img = rgb2gray(img);
    [img_r, img_c, ~] = size(gray_img);

    img_x=conv2(im2double(gray_img), Gx, 'same');
    img_y=conv2(im2double(gray_img), Gy, 'same');
    sobel_imgMAG = sqrt(img_x.^2 + img_y.^2);
    sobel_imgOR = mod(atan2(img_y, img_x), 2*pi);
    F = [];


    for r = 1:row
        for c = 1:col
            %Sizing of the grid to ensure all pixels are covered
            
            r_start = round((r-1)*img_r/row);
            if (r_start == 0)
                r_start = 1;
            end
            r_end = round(r*img_r/row);
            
            c_start = round((c-1)*img_c/col);
            if (c_start == 0)
                c_start = 1;
            end
            c_end = round(c*img_c/col);
                
                
            new_MAGgrid = sobel_imgMAG(r_start:r_end, c_start:c_end);
            new_ORgrid = sobel_imgOR(r_start:r_end, c_start:c_end);
            new_texture_histo = histo_compute(new_MAGgrid, new_ORgrid);
            
            F = [F new_texture_histo];
                
            colour_cell = img(r_start:r_end, c_start:c_end,:);

            mean_r = mean(colour_cell(:,:,1), 'all');
            mean_g = mean(colour_cell(:,:,2), 'all');
            mean_b = mean(colour_cell(:,:,3), 'all');
        
            mean_t = mean_r + mean_g + mean_b;
            F = horzcat(F, [mean_r, mean_g, mean_b]./mean_t);
            
        end
    end

return
    