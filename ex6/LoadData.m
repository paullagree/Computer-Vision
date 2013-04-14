function [X, labs, w, h] = LoadData(DirName)

    ls = dir(strcat(DirName,'train*.png'));

    n = 1000;
    labs = zeros(1, n);
    d = 0;
    im = imread(ls(1).name);

    for i = 1:n
        if i < size(ls,1)
            im = imread(ls(i).name);
            im = double(im);
            if i == 1
                h = size(im, 1);
                w = size(im, 2);
                d = h * w;
                X = zeros(d, n);
            end
            str = ls(i).name;
            expression = '([0-9]+)_([0-9]+).png';
            [tokens, matches] = regexp(str, expression,'tokens','match');
            labs(i) = str2num(tokens{1}{1});
            % labs(1) = t{1}{1};
            im = (im - mean(im(:)))/ std(im(:));
            X(:, i) = im(:);
        end
    end
end
