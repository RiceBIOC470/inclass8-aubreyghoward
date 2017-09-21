%Inclass assignment 8

%Using the swalign function
% A. Create a random DNA sequence of length 100. 
seq = randseq(100)
% B. Create a second sequence from the first one by changing the middle 20 basepairs (at positions 41-60)
seq2 = [seq(1:40) randseq(20) seq(61:100)]
% C. run swalign on the two sequences with the default parameters
[score, align, start] = swalign(seq,seq2,'Alphabet','nt')
% D. run swalign with much higher and lower values of the GapOpen parameter
% and explain the results. 
[score, align, start] = swalign(seq,seq2,'Alphabet','nt','GapOpen',30,'Showscore',true)

[score, align, start] = swalign(seq,seq2,'Alphabet','nt','GapOpen',0.001,'Showscore',true)

%In the first alignment, there is a very large gapopen perameter, which
%will increase the penalty assigned to filling in from the sides.
%This enriches the matrix for filling in from the diagonal. In the
%second alignment, the gapscore is very low, decreasing the overall penalty
%for filling from sides, and allowing for more values to fill from the
%sides compared to the diagonal. This is reflected in the greater amount of
%varience in the non-matching 20bp portion.
%%
% E. run swalign with a low value of GapOpen but a high value of ExtendGap,
% explain the result
[score, align, start] = swalign(seq,seq2,'Alphabet','nt','GapOpen',0.001,'ExtendGap',30,'Showscore',true)

%With the Gapopen perameter very small, we are not penalizing gaps has
%heavily in the sequence. The Extendgap, however, penalizes consecutive
%gaps. So here we see an increase in the amout of variability from
%alignment 1 to alignment 3, but there is a deacrease in variability
%between alignment 2 to alignment 3.

% F. run swalign align with the default value of GapOpen and a low value
% of ExtendGap and explain the result. 

[score, align, start] = swalign(seq,seq2,'Alphabet','nt','ExtendGap',30,'Showscore',true)

%Here we are only penalizing heavily the extensions of gaps, as opposed to
%both gaps and extended gaps. This allows for the formation of gaps, but
%decreases the likelihood for gaps to follow in succession. 