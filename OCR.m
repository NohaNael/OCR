close all;
clear all;
clc;
txt = input('Enter your characters',  's');
keySet = {'0' ,'1','S','5'}
%keySet = {'0' ,'1', '2','3' , '4','5' ,'6' '7','8', '9', 'A' , 'B','a','b','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','c','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
valueSet = {'0.png','C:\\Users\\dell\\Pictures\\1.png','C:\\Users\\dell\\Pictures\\S.png','C:\\Users\\dell\\Desktop\\5.png'};
%valueSet = {'0.PNG' , '1.png', '2.png', '3.png' , '4.png','5.png' ,'6.png','7.PNG', '8.png','9.png','A.png','B.png','aa.png','bb.png','C.png','D.png','E.png','F.png','G.png','H.png','I.png','J.png','K.png','L.png','M.png','N.png','O.png','P.png','Q.png','R.png','S.png','T.png','U.png','V.png','W.png','X.png','Y.png','Z.png','cc.png','ee.png','ff.png','gg.png','hh.png','ii.png','jj.png','kk.png','ll.png','mm.png','nn.png','oo.png','pp.png','qq.png','rr.png','ss.png','tt.png','uu.png','vv.png','ww.png','xx.png','yy.png','zz.png'};
M = containers.Map(keySet,valueSet);

I = rgb2gray(imread('C:\\Users\\dell\\Pictures\\alphanumeric.png'));
[irs ,icol] = size(I);
RGB=I ;
imshow(I);

for i=1 : length(txt) 
    
  M(txt(i))
 T = rgb2gray(imread(M(txt(i))));
 [trs ,tcol] = size(T);
 R = normxcorr2(T,I);   % templete checks every pixel in the org image
 R = imcrop(R,[tcol trs icol irs]);
 [r ,c ,v] = find(R>0.8,1000);
 for j=1:length(c)

   RGB = insertShape(RGB, 'rectangle', [c(j) r(j) tcol trs], 'LineWidth',2);
 end
end
imshow(RGB)