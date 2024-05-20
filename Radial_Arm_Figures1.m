% Radial_Arm_Figures1

% Sesion 16-30 is the learning session of phase of the study
%     note: phase 1 (session 1-15) is a different radial maze with every
%     are having food (8-arm training).
% Baseline is sessions are session 31-35
% Post injury/sham sessions are 36-50

clear d grp grp_i

grp_i(1:4) = 0;

for s = 1:length(sub)

   if sub(s).con == 0 && sub(s).thc == 0
      grp = 1;
      grp_i(1) = grp_i(1) + 1;
   elseif sub(s).con == 0 && sub(s).thc == 1
      grp = 2;
      grp_i(2) = grp_i(2) + 1;
   elseif sub(s).con == 1 && sub(s).thc == 0
      grp = 3;
      grp_i(3) = grp_i(3) + 1;
   elseif sub(s).con == 1 && sub(s).thc == 1
      grp = 4;      
      grp_i(4) = grp_i(4) + 1;
   end

   for ses = 16:length(sub(s).phase(2).session)

      disp(['s=' num2str(s) ' ses=' num2str(ses) ' TET = ' num2str(sub(s).phase(2).session(ses).Tot_Exp_Time)])

      d(grp).TET(grp_i(grp),ses-15) = sub(s).phase(2).session(ses).Tot_Exp_Time;

   end %for ses

end %for s