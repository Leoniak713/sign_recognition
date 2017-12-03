function normalized_image = prepro( imagename )
image = imread(imagename);
BW = filtr(image);
cut_BW = cut_to_palm(BW);
normalized_image = imresize(cut_BW, [200,200]);
imshow(normalized_image);
end

