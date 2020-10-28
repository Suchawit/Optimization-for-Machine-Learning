clear
N4_idft = [1 1 1 1; 1 1i -1 -1i; 1 -1 1 -1; 1 -1i -1 1i]/4;
N2 = [ 1 1;1 -1]/2;
N4_dft = [1 1 1 1; 1 -1i -1 1i; 1 -1 1 -1; 1 1i -1 -1i]; 
data_symbols_first = [cn(3*pi/4); cn(-1*pi/4); cn(pi/4); cn(-1*pi/4)]
data_symbols_second = [cn(-3*pi/4); cn(-1*pi/4); cn(pi/4); cn(-3*pi/4)]

test1 = [ 1 1 1 1]*data_symbols_first/4
test2 = [ 1 1 1 1]*data_symbols_second/4

IDFT1 = N4_idft*data_symbols_first
IDFT2 = N4_idft*data_symbols_second

IDFT = [IDFT1(1) IDFT1(2) IDFT1(3) IDFT1(4) IDFT2(1) IDFT2(2) IDFT2(3) IDFT2(4)]
vecs = [ 0.5*cn(pi/3) 0.2*cn(pi/5)]
linc = conv(IDFT,vecs)
received_data_sym = [ linc(1); linc(2);linc(3);linc(4);linc(5);linc(6);linc(7);linc(8)]
y_first = N4_dft*received_data_sym(1:4)
y_second = N4_dft*received_data_sym(5:8)
y = [y_first; y_second]

IDFTii= [IDFT1(3) IDFT1(4) IDFT1(1) IDFT1(2) IDFT1(3) IDFT1(4) IDFT2(3) IDFT2(4) IDFT2(1) IDFT2(2) IDFT2(3) IDFT2(4)]
linc2 = conv(IDFTii,vecs)
received_data_sym2 = [ linc2(3); linc2(4);linc2(5);linc2(6);linc2(9);linc2(10);linc2(11);linc2(12)]
y2_first= N4_dft*received_data_sym2(1:4)
y2_second= N4_dft*received_data_sym2(5:8)
y2 = [y2_first;y2_second]

symbols = [0.01*cn(-1*pi/5); 0.2*cn(2*pi/3); 0.08; 0.04*cn(pi/6)]
afDFT = N4_dft*symbols
abdft = abs(afDFT)
andft = angle(afDFT)

symbols2 = [cn(pi/4); cn(pi/4); cn(pi/4); cn(pi/4)]
answerc = N4_idft*symbols2