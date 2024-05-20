% Radial_Arm_Parse2
clear tc good_bad t_good_bad T1

for s = 1:length(sub)
   for ses = 16:length(sub(s).phase(2).session) 

      % Finding Total Experiment Time is easy, first time value of T1
      % ("OpenAllDR") to last time value of T1 ("CloseAllDR")

      sub(s).phase(2).session(ses).Tot_Exp_Time = ...
         str2num(sub(s).phase(2).session(ses).T1{end,1}) - ...
         str2num(sub(s).phase(2).session(ses).T1{  1,1});

      if sub(s).phase(2).session(ses).Tot_Exp_Time < 0
         keyboard
      end

      % Find the number of correct and incorrect food troughs

      T1 = sub(s).phase(2).session(ses).T1;


      %good = 0;
      %bad  = 0;
      tc   = 0; %trial count
      good_bad   = [];
      t_good_bad = [];

      for i = 1:size(T1,1)

         if strcmp(T1{i,3},'Correct')
            tc = tc + 1;
            good_bad(tc)   = 1;
            t_good_bad(tc) = T1{i,1};

            %disp("Good Rat - corrrect")
         elseif strcmp(T1{i,3},'Incorrect')

            tc = tc + 1;
            good_bad(tc)   = 0;
            t_good_bad(tc) = T1{i,1};
            %disp("Bad Rat - incorrrect")
         end

      end %i

      %keyboard

      %sub(s).phase(2).session(ses).n_good_trials = good;
      %sub(s).phase(2).session(ses).n_bad_trials  = bad;
      sub(s).phase(2).session(ses).n_good_bad  = good_bad;
      sub(s).phase(2).session(ses).t_good_bad  = t_good_bad;


   end %for ses


end %for s