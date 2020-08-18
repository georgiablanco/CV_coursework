function F = histo_compute(mag_img, orien_img)

    bin = 8;
    mag_thresh = 0.1;
    [img_r, img_c, ~] = size(orien_img);
    orien_vals = [];


    for r = 1:img_r
        for c = 1:img_c
            if (mag_img(r,c) > mag_thresh)
                new_binval = (orien_img(r,c) / 2*pi);
                new_binval = floor(new_binval * bin);
                orien_vals = [orien_vals new_binval];
            end
        end
    end
    
    if size(orien_vals, 2) == 0
        F = zeros(1, bin);
    else
        F = histogram(orien_vals, bin, 'Normalization', 'probability').Values;
    end
