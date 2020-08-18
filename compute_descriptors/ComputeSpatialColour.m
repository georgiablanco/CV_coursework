function F = ComputeSpatialColour(img, row, col)

%%spliting the image by decidded grid and then computing RGB histogram 
    F = [];
    [img_r, img_c, ~] = size(img);

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
                
                
            colour_cell = img(r_start:r_end, c_start:c_end,:);
            
            % Extract the individual red, green, and blue color channels.
            mean_r = mean(colour_cell(:,:,1), 'all');
            mean_g = mean(colour_cell(:,:,2), 'all');
            mean_b = mean(colour_cell(:,:,3), 'all');
            
            mean_t = mean_r + mean_g + mean_b;
            F = horzcat(F, [mean_r, mean_g, mean_b]./mean_t);

        end
    end

    
return;
