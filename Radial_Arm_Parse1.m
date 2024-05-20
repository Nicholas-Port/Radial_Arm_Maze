% Radial_Arm_Parse1


% Finding Total Experiment Time is easy, first time value of T1
% ("OpenAllDR") to last time value of T1 ("CloseAllDR")

sub(1).ses(1).Tot_Exp_Time = str2num(sub(1).ses(1).T1{end,1}) - ...
   str2num(sub(1).ses(1).T1{1,1})


% Find the number of correct and incorrect food troughs

T1 = sub(1).ses(1).T1;



for i = 1:size(T1,1)

   if strcmp(T1{i,3},'Correct')
      disp("Good Rat - corrrect")
   elseif strcmp(T1{i,3},'Correct')
      disp("Bad Rat - incorrrect")
   end


end %i

