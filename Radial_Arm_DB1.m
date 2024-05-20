% Radial_Arm_DB1

% Old Temporary structure
%sub(1).ses(1).fn = 'OG004RAW.011';




%  
dir1 = dir('../OGOKRAW');


for i = 4:length(dir1)

   cohort      = dir1(i).name( 1:2 );
   study_phase = dir1(i).name( 3   );
   animal_id   = dir1(i).name( 4:5 );
   session     = dir1(i).name(10:12);

   s     = str2num(animal_id);
   phase = str2num(study_phase);
   ses   = str2num(session);   
   
   sub(s).cohort = cohort;


   sub(s).phase(phase).session(ses).fn = dir1(i).name;



end %i


% Now store the other items in the database
% Double checked Cody and Nicholas 5-17-2024

% con is concussion 0 or 1 (false or true)
% thc is thc adolscent expsoure (false or true)
% sex is 1=female, 2=male, 3=other

sub(1).con = 0; % Sham
sub(1).thc = 0; % Vehcile
sub(1).sex = 1; % Female

sub(2).con = 0;
sub(2).thc = 0;
sub(2).sex = 1;

sub(3).con = 0;
sub(3).thc = 0;
sub(3).sex = 2;

sub(4).con = 0; 
sub(4).thc = 1; 
sub(4).sex = 2; 

sub(5).con = 0; 
sub(5).thc = 1;
sub(5).sex = 2; 

sub(6).con = 0; 
sub(6).thc = 1; 
sub(6).sex = 1; 

sub(7).con = 0; 
sub(7).thc = 1; 
sub(7).sex = 1; 

sub(8).con = 1; 
sub(8).thc = 0; 
sub(8).sex = 1; 

sub(9).con = 1; 
sub(9).thc = 0; 
sub(9).sex = 1; 

sub(10).con = 1; 
sub(10).thc = 0; 
sub(10).sex = 1; 

sub(11).con = 1; 
sub(11).thc = 0; 
sub(11).sex = 2; 

sub(12).con = 0; 
sub(12).thc = 0; 
sub(12).sex = 2;

sub(13).con = 1;  
sub(13).thc = 1;  
sub(13).sex = 2;  

sub(14).con = 0; 
sub(14).thc = 1; 
sub(14).sex = 1; 

sub(15).con = 1; 
sub(15).thc = 0; 
sub(15).sex = 2; 

sub(16).con = 0; 
sub(16).thc = 0; 
sub(16).sex = 2; 

sub(17).con = 0; 
sub(17).thc = 1; 
sub(17).sex = 2; 

sub(18).con = 1; 
sub(18).thc = 1; 
sub(18).sex = 2; 

sub(19).con = 1; 
sub(19).thc = 1; 
sub(19).sex = 1; 

sub(20).con = 1; 
sub(20).thc = 1; 
sub(20).sex = 1; 

%keyboard