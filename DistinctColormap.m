function map = DistinctColormap(numColors)
% return a colormap (numColors x 3 list of RGB values) that is designed so
% that each color appears distinct to the human eye
%
% Note that currently instead of using an algorithm to optimize the map
% (which would be better) this script simply calls upon two pre-computed
% tables. Thus it fails if there are more than 32 colors requested
% Based upon the paper, with slight modifications (added black, removed
% very dark blue)
%{
@article{glasbey2007colour,
  title={Colour displays for categorical images},
  author={Glasbey, C. and van der Heijden, G. and Toh, V.F.K. and Gray, A.},
  journal={Color Research \& Application},
  volume={32},
  number={4},
  pages={304--309},
  year={2007},
  publisher={Wiley Online Library}
}
%}

if numColors > 31
  error('Not yet implimented for more than 31 colors')
else
  map = [[0   0   0  ]; ...
         [0   0   255]; ...
         [255 0   0  ]; ...
         [0   255 0  ]; ...
         [255 0   182]; ...
         [0   83  0  ]; ...
         [255 211 0  ]; ...
         [0   159 255]; ...
         [154 77  66 ]; ...
         [0   255 190]; ...
         [120 63  193]; ...
         [31  150 152]; ...
         [255 172 253]; ...
         [177 204 113]; ...
         [241 8   92 ]; ...
         [254 143 66 ]; ...
         [221 0   255]; ...
         [32  26  1  ]; ...
         [114 0   85 ]; ...
         [118 108 149]; ...
         [2   173 36 ]; ...
         [200 255 0  ]; ...
         [136 108 0  ]; ...
         [255 183 159]; ...
         [133 133 103]; ...
         [161 3   0  ]; ...
         [20  249 255]; ...
         [0   71  158]; ...
         [220 94  147]; ...
         [147 212 255]; ...
         [0   76  255]];
end

% reduce map to desired size and scale to MATLAB's color format
map = map(1:numColors,:) ./ 255;
return
