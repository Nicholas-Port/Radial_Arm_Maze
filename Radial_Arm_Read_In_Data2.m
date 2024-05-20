% Read in Raw data file

for s = 1:length(sub)
   for phase = 1:2
      for ses = 16:length(sub(s).phase(phase).session)

         fid=fopen(['../OGOKRAW/' sub(s).phase(phase).session(ses).fn ] );

         ii      = 0;
         jj      = 0;
         section = 1;
         once    = 0;
         T1 = table('Size',[1 3],'VariableTypes',{'string','string','string'},'VariableNames',{'Time','EventCode','EventName'});
         T2 = table('Size',[1 2],'VariableTypes',{'string','string'},         'VariableNames',{'ArrEl','Time'});

         temp_line = fgetl(fid);

         warning('off');

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

         end %while feof
         warning('on');



         fclose(fid);

         sub(s).phase(phase).session(ses).T1 = T1;
         sub(s).phase(phase).session(ses).T2 = T2;

         if ses == 29
             keyboard
          end


         clear T1 T2

      end %sesssion
   end %phase
end %sub












%fini