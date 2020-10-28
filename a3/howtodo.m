[xs,fs,k] = grad_desc('f_h','Rosen',[2; -3],1e-6);
[xs,fs,k] = grad_desc('f_h','Rosen',[-3; -3],1e-6);
newton('f_h','Rosen','h_h',[2;3],0.1,1e-6);
newton('f_h','Rosen','h_h',[-3;3],0.1,1e-6);
newton('f_h','Rosen','h_h',[2;-3],0.1,1e-6);
newton('f_h','Rosen','h_h',[-3;-3],0.1,1e-6);