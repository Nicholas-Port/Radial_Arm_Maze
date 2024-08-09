% May 7 2024

dbstop if error

clear all;close all;

BIG_DATA = 1;

%COLORS
RED      = [0.90 0.00 0.15 ];
MAGENTA  = [0.80 0.00 0.80 ];
ORANGE   = [1.00 0.50 0.00 ];
YELLOW   = [1.00 0.68 0.26 ];
GREEN    = [0.09 0.45 0.27 ];
CYAN     = [0.28 0.82 0.80 ];
BLUE     = [0.00 0.00 1.00 ];
BLACK    = [0.00 0.00 0.05 ];
RUST     = [.65  0.20 0.03 ];
GREY     = [0.7  0.7   0.7 ];

if ~BIG_DATA

   % Load Database
   Radial_Arm_DB2

   % Read in the data
   Radial_Arm_Read_In_Data2


   % This may (or may not) be our first attempt at importing a raw data
   % file from the radial arm maze
   %{
fid=fopen("OG004RAW.011");

ii      = 0;
jj      = 0;
section = 1;
once    = 0;
T1 = table('Size',[1 3],'VariableTypes',{'string','string','string'},'VariableNames',{'Time','EventCode','EventName'})
T2 = table('Size',[1 2],'VariableTypes',{'string','string'},         'VariableNames',{'ArrEl','Time'});

temp_line = fgetl(fid);


while ~feof(fid)

   temp_line = fgetl(fid);
   ii = ii + 1;

   cell_line = textscan(temp_line,'%s %s %s');
   col1 = cell_line{1}{1};

   if strcmp(col1,'Array(element)')
      section = 2;
   end

   if section == 1
      T1.Time(ii)      = cell_line{1}{1};
      T1.EventCode(ii) = cell_line{2}{1};
      T1.EventName(ii) = cell_line{3}{1};

   elseif section == 2
      if once == 0
         once = 1;
      elseif once == 1
         jj = jj + 1;
         T2.ArrEl(jj) = cell_line{1}{1};
         T2.Time(jj)  = cell_line{2}{1};

      end

   end



   %keyboard
%

end

fclose(fid);

   %}


   % Parse T1

   Radial_Arm_Parse3

   % Save
   % save -v7.3 Radial_Arm_Big_Data2 sub

else
   load('Radial_Arm_Big_Data2')
   %do nothing

end

% This script (8/6/2024): Radial_Arm_Jon_Cystal_Check2 
% Compares the results of Jon's dosbox program to our (Cody & Nick)
% version of Jon's "Percent Correct"  The results match fairly well. a
% disagreement of about 2%


% We are ready to start writing new analysis programs 














% Fini