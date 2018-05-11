



 /*----------------------------shell-----------------------*/




 


insert into Companies values( 'main@shell.us' , 'shell' , 'fifth settlement' , 'shell.us' , 'multinational', ' help everyone at Shell act in line with these values and comply with relevant laws and regulations. ', 'oil and gas');

insert into Company_Phones values ('main@shell.us' , '0123431818');



insert into Departments values (1, 'main@shell.us' , 'Oil Stations');

insert into Departments values(2,'main@shell.us', 'Oil Products' );

insert into Departments values(3,'main@shell.us', 'Tech Development' );




insert into Users values ('ahmed.hisham', '123456', 'ahmd.hisham@gmail.com' , 30/7/1997, 3 , 'Ahmed', 'Hisham','Rihan');

insert into Users values ('ahmed.akram', '123456', 'ahmd.akram@gmail.com' , 6/9/1996, 3 , 'Ahmed', 'Akram','Elsemellawy');

insert into Users values ('youssef.elkhayat', '123456', 'elkhayat@gmail.com' , 10/11/1997, 3 , 'Youssef', 'Mahmoud','ElKhayat');

insert into Users values('youssef.yasser', '123456', 'yasser@gmail.com' , 26/2/1997, 3 , 'Youssef', 'Yasser','AbdelAziz');

insert into Users values('yousra.ellouzy', '123456', 'yousra@sgmail.com' , 12/6/1997, 3 , 'Yousra', 'Mahmoud','ElLouzy');

insert into Users values('maher.elsharkawy', '123456', 'elsharkawy@gmail.com' , '7/5/1997', 1 , 'Maher', 'Ahmed','ElSharkawy');

insert into Users values('badr.elnawasany', '123456', 'elnawasany@gmail.com' , '11/11/1997', 1 , 'Badr', 'AbdelRaheem','ElNawasany');

insert into Users values('tarek.elwakil', '123456', 'elwakil@gmail.com' , '11/1/1960', 2 , 'Tarek', 'Mahmoud','ElWakil');

insert into Users values('ramadan.abuelalamein', '123456', 'ramadan@gmail.com' , '11/1/1960', 2 , 'Ramadan', 'AbuElAlamein','Hamouda');

insert into Users values('tameem.younis', '123456', 'younis@gmail.com' , '12/3/2000', 1 , 'Tameem', 'Ahmed','Younis');

insert into Users values('essam.elhadary', '123456', 'elhadary@gmail.com' , '11/1/1960' , 3 , 'Essam', 'Kamal','ElHadary');

insert into Users values('aliaa.samir', '123456', 'samir@gmail.com' , '2/3/1998', 2 , 'Aliaa', 'Samir','Mohamed');

insert into Users values('applicant.elhusseiny', '123456' , 'elhusseiny@gmail.com', '8/5/1995' , 2 , 'Applicant',null,'ElHusseiny');










insert into Jobs values('Marketing Manager' ,1, 'main@shell.us', 'Manages all the teams of marketing', 'Manages the marketing process and organizes the teams of the marketers', 2, 6000.00 , '07/20/2020' , 9, 8);

insert into Jobs values('Trainer',1,'main@shell.us', 'Responsible for training new interns ', 'Makes sure every intern is doing the job required and also training new employees till they master their job', 1, 4000.00 , '11/20/2018' , 7, 8);

insert into Jobs values('Product Manager',1,'main@shell.us', 'Manages all the products of the company', 'Responsible for ensuring high quality and lowest possible cost for the company products', 3, 8000 , '05/11/2019' , 8 ,8);




insert into Jobs values('Marketing Manager', 2 ,'main@shell.us', 'Manages all the teams of marketing', 'Manages the marketing process and organizes the teams of the marketers', 2, 6000 , '06/11/2018' , 9, 8);

insert into Jobs values('Trainer',2,'main@shell.us', 'Responsible for training new interns ','Makes sure every intern is doing the job required and also training new employees till they master their job', 1, 4000 , '09/11/2018' , 7 , 8);

insert into Jobs values('Product Manager',2,'main@shell.us', 'Manages all the products of the company', 'Responsible for ensuring high quality and lowest possible cost for the companys products', 3, 8000 , '06/11/2018' , 8, 8);




insert into Jobs values('Marketing Manager', 3 ,'main@shell.us', 'Manages all the teams of marketing', 'Manages the marketing process and organizes the teams of the marketers', 2, 6000 , '03/11/2018' , 9, 8);

insert into Jobs values('Trainer',3,'main@shell.us', 'Responsible for training new interns ','Makes sure every intern is doing the job required and also training new employees till they master their job', 1, 4000 , '12/11/2018' , 7 , 8);

insert into Jobs values('Product Manager',3,'main@shell.us', 'Manages all the products of the company', 'Responsible for ensuring high quality and lowest possible cost for the companys products', 3, 8000 , '06/11/2020' , 8, 8);


insert into Jobs_Users values ('ahmed.akram','Trainer');
insert into Jobs_Users values ('ahmed.hisham','Trainer');

insert into Jobs_Users values ('youssef.yasser','Marketing Manager');
insert into Jobs_Users values ('youssef.elkhayat','Product Manager');

insert into Jobs_Users values ('maher.elsharkawy','Trainer');
insert into Jobs_Users values ('badr.elnawasany','Trainer');

insert into Jobs_Users values ('tarek.elwakil','Marketing Manager');
insert into Jobs_Users values ('yousra.ellouzy','Product Manager');

insert into Jobs_Users values ('ramadan.abuelalamein','Trainer');
insert into Jobs_Users values ('tameem.younis','Trainer');

insert into Jobs_Users values ('essam.elhadary','Marketing Manager');
insert into Jobs_Users values ('aliaa.samir','Product Manager');




insert into Questions values('Do marketing campaigns affect the revenue of the company',1);

insert into Questions values('Is it crucial to train new employees',1);

insert into Questions values('Quality of the product is not an important aspect',0);


insert into Jobs_has_Questions values ('Marketing Manager',1,'main@shell.us',1);
insert into Jobs_has_Questions values ('Trainer',1,'main@shell.us',2);
insert into Jobs_has_Questions values ('Product Manager',1,'main@shell.us',3);

insert into Jobs_has_Questions values ('Marketing Manager',2,'main@shell.us',1);
insert into Jobs_has_Questions values ('Trainer',2,'main@shell.us',2);
insert into Jobs_has_Questions values ('Product Manager',2,'main@shell.us',3);

insert into Jobs_has_Questions values ('Marketing Manager',3,'main@shell.us',1);
insert into Jobs_has_Questions values ('Trainer',3,'main@shell.us',2);
insert into Jobs_has_Questions values ('Product Manager',3,'main@shell.us',3);



insert into Staff_Members values ('ahmed.akram' , 5 , 'friday and saturday' ,10000, 'Trainer' , 1, 'main@shell.us');
insert into HR_Employees values ('ahmed.akram');

insert into Staff_Members values ('ahmed.hisham' , 5, 'friday and saturday' ,150000, 'Trainer', 1, 'main@shell.us');
insert into HR_Employees values ('ahmed.hisham');

insert into Staff_Members values ('youssef.yasser' , 10 ,  'friday and saturday' ,10000, 'Marketing Manager' , 1, 'main@shell.us');
insert into Managers values ('youssef.yasser', 'Marketing Manager');

insert into Staff_Members values ('youssef.elkhayat' , 10 ,  'friday and saturday' ,150000, 'Product Manager' , 1, 'main@shell.us');
insert into Managers values ('youssef.elkhayat', 'Product Manager');

insert into Staff_Members values ('maher.elsharkawy' , 9,  'friday and saturday' ,10000, 'Trainer' , 2, 'main@shell.us');
insert into HR_Employees values('maher.elsharkawy');

insert into Staff_Members values ('badr.elnawasany' , 30,  'friday and saturday' ,150000, 'Trainer' , 2, 'main@shell.us');
insert into HR_Employees values ('badr.elnawasany');

insert into Staff_Members values ('tarek.elwakil' , 15 ,  'friday and saturday' ,250000, 'Marketing Manager' , 2, 'main@shell.us');
insert into Managers values ('tarek.elwakil', 'Marketing Manager');

insert into Staff_Members values ('yousra.ellouzy' , 23 ,  'friday and saturday' ,360000, 'Product Manager' , 2, 'main@shell.us');
insert into Managers values ('yousra.ellouzy', 'Product Manager');

insert into Staff_Members values ('ramadan.abuelalamein' , 2,  'friday and saturday' ,80000, 'Trainer' , 3, 'main@shell.us');
insert into HR_Employees values ('ramadan.abuelalamein');

insert into Staff_Members values ('tameem.younis' , 100,  'friday and saturday' ,140000, 'Trainer' , 3, 'main@shell.us');
insert into HR_Employees values ('tameem.younis');

insert into Staff_Members values ('essam.elhadary' , 15,   'friday and saturday' ,190000, 'Marketing Manager' , 3, 'main@shell.us');
insert into Managers values ('essam.elhadary' , 'Marketing Manager' );

insert into Staff_Members values ('aliaa.samir' , 27,  'friday and saturday' ,1560000, 'Product Manager' , 3, 'main@shell.us');
insert into Managers values('aliaa.samir' , 'Product Manager');


insert into Job_Seekers values ('applicant.ElHusseiny');

insert into Jobs_apply_Job_Seekers values ('Trainer',3,'main@shell.us', 'applicant.elhusseiny',null, null, null);





















/*---------------------phillips---------------------*/





















insert into Companies values ('philips@philipsn.v', 'Philips', 'Nasr City', 'PhilipsN.V.', 'Multinational',
		 'A healthier, happier, more sustainable future for all', 'Healthcare,lightning') ;

		insert into Company_Phones values( 'philips@philipsn.v', '+31 20 59 77777' );

		insert into Departments values(1, 'philips@philipsn.v'  , 'Healthcare');
		insert into Departments values(2, 'philips@philipsn.v' , 'Lightning');
		insert into Departments values(3, 'philips@philipsn.v' , 'Electronics');



	

		insert into Jobs values ('Marketing Intern', 1,'philips@philipsn.v', 'Responsible for the marketing ', 'Internships are typically short-term, lasting anywhere from several weeks to a couple of months, and are designed to apply the knowledge gained from classroom instruction to the real world by exposing the individual to the essential responsibilities of a marketing representative.' , 5, 30000.00, '10/22/2018' , 20, 7);

insert into Jobs values ('Account Manager' , 1, 'philips@philipsn.v', 'Responsible for supplying everything ', 'A formal Relationship Manager or Account Manager role. Such individuals often sit within the business unit that interacts most frequently with that supplier, or may be filled by a category manager in the procurement function.' , 3, 20000.00, '4/27/2019', 30, 6);

insert into Jobs values ('Software Architect' , 1 ,'philips@philipsn.v', 'Responsible for designing the software', 'A software architect is a software expert who makes high-level design choices and dictates technical standards, including software coding standards, tools, and platforms. The leading expert is referred to as the chief architect.' , 4, 10000.00, '6/26/2018', 14, 8);


/* 2 MNAGERS AND 2 HR IN 1st DEP*/

insert into Jobs values ('Manpower planning' , 1 ,'philips@philipsn.v',' Responsible for employees development' ,'To provide advice and guidance on all aspects of the Human Resources function relating to recruitment and selection matters and associated terms and conditions.', 5, 20000.00, 23/6/2018, 12, 8);

insert into Jobs values ('Trainer' , 1 , 'philips@philipsn.v', 'Responsible for training new employees', 'Strong communication, presentation and organizational skills. Develop & maintains positive relationships with students in order to monitor & resolve students concerns.' , 3, 22000.00, 1/2/2018, 14, 8);


insert into Jobs values ('Product Manager' , 1 , 'philips@philipsn.v', 'Responsible for managing any product .', 'responsible for the strategy, roadmap, and feature definition for that product or product line. The position may also include marketing, forecasting, and profit and loss (P&L) responsibilities.' , 6, 22000.00, 12/2/2018, 17, 7);


insert into Jobs values ('Marketing Manager' , 1 , 'philips@philipsn.v', 'responsible fpr managing marketing','manages the marketing of a business or product. They can be responsible for several services or products, or be in charge of a single product. A marketing manager needs to have an outgoing, gregarious, and spontaneous nature.' , 2, 22000.00, 12/2/2018, 10, 7);





/* 2 MNAGERS AND 2 HR IN 2nd DEP*/



insert into Jobs values ('Manpower planning' , 2,'philips@philipsn.v', ' Responsible for employees development' ,'To provide advice and guidance on all aspects of the Human Resources function relating to recruitment and selection matters and associated terms and conditions.', 5, 20000.00, '6/23/2018', 12, 8);

insert into Jobs values ('Trainer' , 2 , 'philips@philipsn.v', 'Responsible for training new employees', 'Strong communication, presentation and organizational skills. Develop & maintains positive relationships with students in order to monitor & resolve students concerns.' , 3, 22000.00, '1/2/2018', 14, 8);


insert into Jobs values ('Product Manager' , 2 , 'philips@philipsn.v', 'Responsible for managing any product', 'responsible for the strategy, roadmap, and feature definition for that product or product line. The position may also include marketing, forecasting, and profit and loss (P&L) responsibilities.' , 6, 22000.00, '12/2/2018', 17, 7);


insert into Jobs values ('Marketing Manager' , 2 , 'philips@philipsn.v', 'responsible fpr managing marketing', 'manages the marketing of a business or product. They can be responsible for several services or products, or be in charge of a single product. A marketing manager needs to have an outgoing, gregarious, and spontaneous nature.' , 2, 22000.00, '12/2/2018', 10, 7);



/* 2 MNAGERS AND 2 HR IN THIRD DEP*/



insert into Jobs values ('Manpower planning' , 3 ,'philips@philipsn.v',' Responsible for employees development' , 'To provide advice and guidance on all aspects of the Human Resources function relating to recruitment and selection matters and associated terms and conditions.', 5, 20000.00, '6/23/2018', 12, 8);

insert into Jobs values ('Trainer' , 3 , 'philips@philipsn.v', 'Responsible for training new employees', 'Strong communication, presentation and organizational skills. Develop & maintains positive relationships with students in order to monitor & resolve students concerns.' , 3, 22000.00, '1/2/2018', 14, 8);


insert into Jobs values ('Product Manager' , 3 , 'philips@philipsn.v', 'Responsible for managing any product', 'responsible for the strategy, roadmap, and feature definition for that product or product line. The position may also include marketing, forecasting, and profit and loss (P&L) responsibilities.' , 6, 22000.00, '12/2/2018', 17, 7);


insert into Jobs values ('Marketing Manager' , 3 , 'philips@philipsn.v', 'responsible fpr managing marketing', 'manages the marketing of a business or product. They can be responsible for several services or products, or be in charge of a single product. A marketing manager needs to have an outgoing, gregarious, and spontaneous nature.' , 2, 22000.00, '12/2/2018', 10, 7);



insert into Questions values ('Do you think you are a good planner?' , 1 );

insert into Questions values ('Do you think you are a good trainer?' , 1 );

insert into Questions values ('Do you think you are a good manager?' , 1 );

insert into Questions values ('Does marketing affect the net profit of the company?' , 1 );



insert into Jobs_has_Questions values ('Manpower planning' , 1 ,'philips@philipsn.v', 4);

insert into Jobs_has_Questions values ('Trainer' , 1 , 'philips@philipsn.v', 5);


insert into Jobs_has_Questions values ('Product Manager' , 1 , 'philips@philipsn.v', 6);

insert into Jobs_has_Questions values ('Marketing Manager' , 1 , 'philips@philipsn.v', 7);


/*===========*/

insert into Jobs_has_Questions values ('Manpower planning' , 2 ,'philips@philipsn.v', 4);

insert into Jobs_has_Questions values ('Trainer' , 2 , 'philips@philipsn.v', 5);


insert into Jobs_has_Questions values ('Product Manager' , 2 , 'philips@philipsn.v', 6);

insert into Jobs_has_Questions values ('Marketing Manager' , 2 , 'philips@philipsn.v', 7);


/*===========*/




insert into Jobs_has_Questions values ('Manpower planning' , 3 ,'philips@philipsn.v', 4);

insert into Jobs_has_Questions values ('Trainer' , 3 , 'philips@philipsn.v', 5);


insert into Jobs_has_Questions values ('Product Manager' , 3 , 'philips@philipsn.v', 6);

insert into Jobs_has_Questions values ('Marketing Manager' , 3 , 'philips@philipsn.v', 7);







/*users*/

insert into Users values( 'Nour.Elnady' , 53535353, 'Nour.Elnady@gmail.com' , 4/27/1998 , 1, 'nour' , 'mahmoud', 'elnady');

insert into Users values( 'Ahmed.Amr' , 52626485, 'Ahmed.Amr@gmail.com' , 9/20/1997 , 1, 'ahmed' , 'amr',
'abdulhamed');

insert into Users values('Ahmed.Helmy' , 52626485, 'Ahmed.Helmy@gmail.com' , '10/20/1997' , 1, 'ahmed' , 'alaa',
'helmy');

insert into Users values( 'Mona.Zaki' , 52626485,'Mona.Zaki@gmail.com' , '2/3/1997' , 1, 'mona' , 'ibrahim',
'zaki');

insert into Users values( 'Abdulfatah.Elsisi', 52626485, 'Abdulfatah.Elsisi@gmail.com' , '3/2/1997' , 1, 'abdulfatah' , 'khalil',
'elsisi');

insert into Users values( 'Seif.Amgad', 52626485, 'Seif.Amgad@gmail.com' , '4/7/1997' , 2, 'seif' , 'amgad',
'nabil');

insert into Users values( 'Mohamed.Ibrahim' , 52626485, 'Mohamed.Ibrahim@gmail.com' , '2/12/1997' , 1, 'mohamed' , 'ibrahim',
'abdulhamed');

insert into Users values( 'Nayera.Medhat', 52626485, 'Nayera.Medhat@gmail.com' , '9/9/1997' , 1, 'nayera' , 'medhat',
'elgameel');

insert into Users values( 'Adel.Essam' , 52626485, 'Adel.Essam@gmail.com', '10/9/1997' , 1, 'adel' , 'essam',
'elrouby');

insert into Users values('Youssef.saeed', 52626485, 'Youssef.saeed@gmail.com', '8/10/1997' , 1, 'youssef' , 'amr',
'saeed');

insert into Users values( 'Karim.Kamal' , 52626485, 'Karim.Kamal@gmail.com' ,'6/14/1997' , 1, 'karim' , 'kamal',
'kamal');

insert into Users values( 'Ali.Kamel' , 52626485, 'Ali.Kamel@gmail.com' , '8/4/1997' , 1, 'ali' , 'kamel',
'abdulhamed');

/* ============== */



insert into Users values( 'Mohamed.Ashraf' , 52626485, 'Mohamed.Ashraf@gmail.com' , '2/9/1997' , 1, 'Mohamed' , 'Ashraf',
'El-Sokkary');



insert into Jobs_Users values ('Nour.Elnady','Trainer');
insert into Jobs_Users values ('Ahmed.Amr','Manpower planning');
insert into Jobs_Users values ('Ahmed.Helmy','Trainer');
insert into Jobs_Users values ('Mona.Zaki','Manpower planning');
insert into Jobs_Users values ('Abdulfatah.elsisi','Trainer');
insert into Jobs_Users values ('Seif.Amgad','Manpower planning');

insert into Jobs_Users values ('Mohamed.Ibrahim','Marketing Manager');
insert into Jobs_Users values ('Nayera.Medhat','Product Manager');
insert into Jobs_Users values ('Adel.Essam','Marketing Manager');
insert into Jobs_Users values ('Youssef.Saeed','Product Manager');
insert into Jobs_Users values ('Karim.Kamal','Marketing Manager');
insert into Jobs_Users values ('Ali.Kamel','Product Manager');




insert into Job_Seekers values('Mohamed.Ashraf');







/*HR*/

insert into Staff_Members values ('Nour.Elnady' , 20, 'Friday' , 20000.00, 'Trainer' , 1, 'philips@philipsn.v');
insert into HR_Employees values( 'Nour.Elnady');


insert into Staff_Members values ('Ahmed.Amr' , 30, 'Friday' , 30000.00, 'Manpower planning' , 1, 'philips@philipsn.v');
insert into HR_Employees values( 'Ahmed.Amr' );


insert into Staff_Members values ('Ahmed.Helmy' , 25,  'Friday' , 24000.00, 'Trainer' , 2, 'philips@philipsn.v');
insert into HR_Employees values( 'Ahmed.Helmy' );

insert into Staff_Members values ('Mona.Zaki' , 45,  'Friday' , 35000.00, 'Manpower planning' , 2, 'philips@philipsn.v');
insert into HR_Employees values( 'Mona.Zaki');

insert into Staff_Members values ('Abdulfatah.Elsisi' , 3, 'Friday' , 34000.00, 'Trainer' , 3, 'philips@philipsn.v');
insert into HR_Employees values('Abdulfatah.Elsisi' );

insert into Staff_Members values ('Seif.Amgad' , 40,  'Friday' , 55000.00, 'Manpower planning' , 3, 'philips@philipsn.v');

insert into HR_Employees values('Seif.Amgad');


/*MANAGERS*/

insert into Staff_Members values ('Mohamed.Ibrahim' , 5, 'Friday' , 5000.00, 'Marketing Manager' , 1, 'philips@philipsn.v');
insert into Managers values ('Mohamed.Ibrahim', 'marketing');

insert into Staff_Members values ('Nayera.Medhat' , 15,  'Friday' , 15000.00, 'Product Manager' , 1, 'philips@philipsn.v');
insert into Managers values ('Nayera.Medhat' , 'product');



insert into Staff_Members values ('Adel.Essam' , 5, 'Friday' , 7000.00, 'Marketing Manager' , 2, 'philips@philipsn.v');
insert into Managers values ('Adel.Essam',  'marketing');

insert into Staff_Members values ('Youssef.saeed' , 25, 'Friday' , 30000.00, 'Product Manager' , 2, 'philips@philipsn.v');

insert into Managers values('Youssef.saeed' ,  'product');



insert into Staff_Members values ('Karim.Kamal' , 20,  'Friday' , 5000.00, 'Marketing Manager' , 3, 'philips@philipsn.v');
insert into Managers values('Karim.Kamal' ,  'marketing');

insert into Staff_Members values ('Ali.kamel' , 30,  'Friday' , 15000.00, 'Product Manager' , 3, 'philips@philipsn.v');
insert into Managers values('Ali.kamel' ,  'product');











insert into Jobs_apply_Job_Seekers values ('Manpower planning' , 2,'philips@philipsn.v', 'Mohamed.Ashraf',null,null,null);






















/*----------------------vodafone-------------------*/




































insert into Companies values (
'vodafoneEG@VodafoneNZ',
'vodafone',
'smart village',
'VodafoneNZ',
'international',
'delivering integerated values and adding services that leverage telecom experinces',
'telecom'

);

insert into Company_phones values(
 'vodafoneEG@VodafoneNZ', 
'022234567'


);
 insert into Departments values  ( 
 1,
  'vodafoneEG@VodafoneNZ',
 'finance'
 );

 insert into Departments values  (
 
 2,
 'vodafoneEG@VodafoneNZ',
 'marketing'
 
 
 );

  insert into Departments values  (
 
 3,
  'vodafoneEG@VodafoneNZ',
 'it'
 
 
 );
 insert into Users values(
 'mohamed.abotreaka',
 '123',
 'treaka@VodafoneNZ',
 '7/11/1975',
 5,
 'mohamed',
 'mohamed',
 'abotreaka'

 );
 
 insert into Users values(
 'mohamed.barakat',
 '123',
 'barakat@VodafoneNZ',
 '7/12/1975',
 12,
 'mohamed',
 'mohamed',
 'barakat'

 );
 insert into Users values(
 'hassan.hosny',
 '123',
 'hosny@VodafoneNZ',
 '7/1/1975',
 25,
 'hassan',
 'karim',
 'hosny'

 );

 insert into Users values(
 'ahmed.ezz',
 '123',
 'ezz@VodafoneNZ',
 '7/11/1975',
 5,
 'ahmed',
 'khaled',
 'ezz'

 );
  insert into Users values(
 'talaat.zakareya',
 '123',
 'zakareya@VodafoneNZ',
 '7/11/1985',
 5,
 'talaat',
 'yasser',
 'zakareya'

 );
  insert into Users values(
 'ali.moslim',
 '123',
 'moslim@VodafoneNZ',
 '7/11/1975',
 5,
 'ali',
 'taha',
 'moslim'

 );
  insert into Users values(
 'nader.sayed',
 '123',
 'sayed@VodafoneNZ',
 '7/6/1965',
 5,
 'nader',
 'hani',
 'sayed'

 );

  insert into Users values(
 'ellon.musk',
 '123',
 'musk@VodafoneNZ',
 '9/11/1975',
 15,
 'ellon',
 'john',
 'musk'

 );

  insert into Users values(
 'bill.gates',
 '123',
 'gates@VodafoneNZ',
 '7/11/1975',
 5,
 'bill',
 'william',
 'gates'

 );

  insert into Users values(
 'ahmed.salkka',
 '123',
 'sakka@VodafoneNZ',
 '7/11/1955',
 25,
 'ahmed',
 'salah',
 'sakka'

 );
  insert into Users values(
 'mohamed.homos',
 '123',
 'homos@VodafoneNZ',
 '12/11/1965',
 5,
 'mohamed',
 'hosni',
 'homos'

 );



  insert into Users values(
 'tamer.zakareya',
 '123',
 'tamer@VodafoneNZ',
 '12/11/1965',
 5,
 'tamer',
 'hosni',
 'zakareya'

 );

 insert into Users values(
 'sami.eladl',
 '123',
 'sami@VodafoneNZ',
 '12/11/1965',
 5,
 'sami',
 'basha',
 'eladl'

 );

 
 insert into Jobs values ('Officer' ,
		  1 , 
		  'vodafoneEG@VodafoneNZ', 
		  'Responsible for Human Resources', 
		  'Promote management excellence in the office by ensuring accountability in all areas of HR and by demonstrating a high level of skills in the management of staff resources' ,
		   5,
		    20000.00, 
			'6/6/2018', 
			12,
			 8);

		insert into Jobs values ('Trainer' ,
		 1 , 'vodafoneEG@VodafoneNZ',
		  'Responsible for training new employees', 
		  'Strong communication, presentation and organizational skills. Develop & maintains positive relationships with students in order to monitor & resolve students concerns.' 
		  , 3, 
		  22000.00,' 1/2/2018'
		  , 14
		  , 8);

		  insert into Jobs values ('Officer' ,
		 2 , 
		  'vodafoneEG@VodafoneNZ', 
		  'Responsible for Human Resources', 
		  'Promote management excellence in the office by ensuring accountability in all areas of HR and by demonstrating a high level of skills in the management of staff resources' ,
		   5,
		    20000.00, 
			'6/23/2018', 
			12,
			 8);

			 

		insert into Jobs values ('Trainer' ,
		 2 , 'vodafoneEG@VodafoneNZ',
		  'Responsible for training new employees', 
		  'Strong communication, presentation and organizational skills. Develop & maintains positive relationships with students in order to monitor & resolve students concerns.' 
		  , 3, 
		  22000.00,' 1/2/2018'
		  , 14
		  , 8);

		  insert into Jobs values ('Officer' ,
		  3, 
		  'vodafoneEG@VodafoneNZ', 
		  'Responsible for Human Resources', 
		  'Promote management excellence in the office by ensuring accountability in all areas of HR and by demonstrating a high level of skills in the management of staff resources' ,
		   5,
		    20000.00, 
			'5/6/2018', 
			12,
			 8);
		 insert into Jobs values ('Trainer' ,
		 3 , 'vodafoneEG@VodafoneNZ',
		  'Responsible for training new employees', 
		  'Strong communication, presentation and organizational skills. Develop & maintains positive relationships with students in order to monitor & resolve students concerns.' 
		  , 3, 
		  22000.00,' 1/2/2018'
		  , 14
		  , 8);
  insert into Jobs values ('Product Manager' , 1 , 'vodafoneEG@VodafoneNZ', 'Responsible for managing any product ', 'responsible for the strategy, roadmap, and feature definition for that product or product line.' , 6, 22000.00, '12/2/2018', 17, 7);

	insert into Jobs values ('Marketing Manager' , 1 , 'vodafoneEG@VodafoneNZ','manages marketing stratigies', 'manages the marketing of a business or product. They can be responsible for several services or products, or be in charge of a single product.' , 2, 22000.00, '12/2/2018', 10, 7);

  insert into Jobs values ('Product Manager' , 2 , 'vodafoneEG@VodafoneNZ', 'Responsible for managing any product', 'responsible for the strategy, roadmap, and feature definition for that product or product line. ' , 6, 22000.00, '12/2/2018', 17, 7);

	insert into Jobs values ('Marketing Manager' , 2 , 'vodafoneEG@VodafoneNZ','manages marketing stratigies',  'manages the marketing of a business or product. They can be responsible for several services or products, or be in charge of a single product. ' , 2, 22000.00, '12/2/2018', 10, 7)

	 insert into Jobs values ('Product Manager' , 3 , 'vodafoneEG@VodafoneNZ', 'Responsible for managing any product', 'responsible for the strategy, roadmap, and feature definition for that product or product line. ' , 6, 22000.00, '12/2/2018', 17, 7);

	insert into Jobs values ('Marketing Manager' , 3 , 'vodafoneEG@VodafoneNZ','manages marketing stratigies',  'manages the marketing of a business or product. They can be responsible for several services or products, or be in charge of a single product. ' , 2, 22000.00, '12/2/2018', 10, 7)



  
  














 

 insert into Staff_members values(
'mohamed.abotreaka',
15,
'friday',
 90000,
 'Product Manager' ,
 1,
  'vodafoneEG@VodafoneNZ'
);
insert into Staff_members values(
'mohamed.barakat',
15,
'friday',
 90000,
 'Product Manager' ,
 1,
 'vodafoneEG@VodafoneNZ'
);
insert into Staff_members values(
'hassan.hosny',
15,
'friday',
 90000,
 'Product Manager' ,
 1,
 'vodafoneEG@VodafoneNZ'
);
insert into Staff_members values(
'ahmed.ezz',
15,
'friday',
 90000,
 'Marketing Manager',
1,
 'vodafoneEG@VodafoneNZ'
);
insert into Staff_members values(
'talaat.zakareya',
15,
'friday',
 90000,
 'Marketing Manager',
 2,
 'vodafoneEG@VodafoneNZ'
);


insert into Staff_members values(
'tamer.zakareya',
15,
'friday',
 90000,
 'Marketing Manager',
 2,
 'vodafoneEG@VodafoneNZ'
);









insert into Staff_members values(
'ali.moslim',
15,
'friday',
 90000,
 'Trainer',
 2,
'vodafoneEG@VodafoneNZ'
);
insert into Staff_members values(
'nader.sayed',
15,
'friday',
 90000,
 'Trainer',
 2,
 'vodafoneEG@VodafoneNZ'
);
insert into Staff_Members values(
'ellon.musk',
15,
'friday',
 90000,
 'Trainer',
 3,
 'vodafoneEG@VodafoneNZ'
);
insert into Staff_members values(
'bill.gates',
15,
'friday',
 90000,
 'Trainer',
 3,
 'vodafoneEG@VodafoneNZ'
);
insert into Staff_members values(
'ahmed.salkka',
15,
'friday',
 90000,
 'Officer',
 3,
 'vodafoneEG@VodafoneNZ'
);
insert into Staff_members values(
'mohamed.homos',
15,
'friday',
 90000,
 'Officer',
 3,
'vodafoneEG@VodafoneNZ'
);

insert into Hr_employees values(
'mohamed.homos'

);

insert into Hr_employees values(
'ahmed.salkka'

); 
insert into Hr_employees values(
'bill.gates'

);
insert into Hr_employees values(
'ellon.musk'
);
insert into Hr_employees values(
'ali.moslim'
);

insert into Hr_Employees values(
'nader.sayed'

);



insert into Managers values(
'tamer.zakareya',
'Marketing');

insert into Managers values(
'talaat.zakareya',
'Marketing');
insert into Managers values(
'ahmed.ezz',
'marketing');

insert into Managers values(
'hassan.hosny',
'product'
);
insert into Managers values(
'mohamed.barakat',
  'product');
insert into Managers values(
'mohamed.abotreaka',
'product'
);
insert into Questions values( 'Do you think you are a good planner?',1);
insert into Questions values( 'Do you think you are a good manager?',1);
insert into Questions values( 'Do you think you are a good trainer?',1);
insert into Questions values( 'will mobiles disappear in ten years?',1);
insert into Jobs_has_Questions values ('Product Manager',1,'vodafoneEG@VodafoneNZ',1);
insert into Jobs_has_Questions values ('marketing Manager',1,'vodafoneEG@VodafoneNZ',2);
insert into Jobs_has_Questions values ('Trainer',1,'vodafoneEG@VodafoneNZ',3);
insert into Jobs_has_Questions values ('Officer' ,1,'vodafoneEG@VodafoneNZ',4);


insert into Jobs_has_Questions values ('Product Manager',2,'vodafoneEG@VodafoneNZ',1);
insert into Jobs_has_Questions values ('marketing Manager',2,'vodafoneEG@VodafoneNZ',2);
insert into Jobs_has_Questions values ('Trainer ',2,'vodafoneEG@VodafoneNZ',3);
insert into Jobs_has_Questions values ('Officer' ,2,'vodafoneEG@VodafoneNZ',4);


insert into Jobs_has_Questions values ('Product Manager',3,'vodafoneEG@VodafoneNZ',1);
insert into Jobs_has_Questions values ('marketing Manager',3,'vodafoneEG@VodafoneNZ',2);
insert into Jobs_has_Questions values ('Trainer ',3,'vodafoneEG@VodafoneNZ',3);
insert into Jobs_has_Questions values ('Officer' ,3,'vodafoneEG@VodafoneNZ',4);




 insert into  Jobs_Users values('mohamed.abotreaka', 'Product Manager');
 insert into  Jobs_Users values('mohamed.barakat', 'Product Manager');
 insert into  Jobs_Users values('hassan.hosny', 'Product Manager');
  insert into  Jobs_Users values('talaat.zakareya', 'Marketing Manager');
insert into  Jobs_Users values('tamer.zakareya', 'Marketing Manager');
insert into Jobs_Users values('ahmed.ezz' , 'Marketing Manager' );
insert into  Jobs_Users values('ali.moslim', 'Trainer');
insert into  Jobs_Users values('nader.sayed', 'Trainer');
insert into  Jobs_Users values('bill.gates', 'Trainer');
insert into  Jobs_Users values('ellon.musk', 'Trainer'); 
insert into  Jobs_Users values('ahmed.salkka', 'Officer');
 insert into  Jobs_Users values('mohamed.homos', 'Officer');

 insert into Job_Seekers values('sami.eladl');
 insert into Jobs_apply_Job_Seekers values ('Product Manager',1,'vodafoneEG@VodafoneNZ','sami.eladl',null,null,null);

  


























  insert into Announcements values ( '11/15/2017' , 'fees', 'Ahmed.Helmy' , 'imp' , 'pay the fees for the trip')












  
insert into Requests values ('2/2/2018' , 'Ahmed.Helmy' , '2/5/2018' , getdate() , null , 1 , null , null , 'Youssef.saeed')
insert into Requests values ('4/4/2018' , 'Nour.Elnady' , '4/7/2018' , getdate() , null , 1 , null , null , 'Nayera.Medhat')




insert into Users values ('fadl.meto', '123456', 'fadl.meto@gmail.com' , '3/7/1997', 3 , 'fadl', 'matio','meto');insert into Jobs values('engineer' ,1, 'main@shell.us', 'works in oil exploration', 'search for oil and gas in deserts and dig for it', 2, 8000.00 , '07/20/2020' , 2, 8);insert into Staff_Members values ('fadl.meto' , 5 , 'friday and saturday' ,500000, 'engineer', 1, 'main@shell.us');

 insert into Regular_Employees values ('fadl.meto');



insert into Users values ('elset.korya', '123456', 'elset.korya@gmail.com' , '3/7/1997', 3 , 'elset', 'elgamela','korya');insert into Jobs values('petrolist' ,1, 'main@shell.us', 'works in oil exploration', 'search for oil and gas in deserts and dig for it', 2, 8000.00 , '07/20/2020' , 2, 8);insert into Staff_Members values ('elset.korya' , 5 , 'friday and saturday' ,500000, 'petrolist', 1, 'main@shell.us');

 insert into Regular_Employees values ('elset.korya');


 insert into Users values ('ahmed.medany', '123456', 'ahmed.medany@gmail.com' , '3/7/1997', 3 , 'ahmed', 'ihab','elmedany');insert into Jobs values('petrolist' ,2, 'main@shell.us', 'works in oil exploration', 'search for oil and gas in deserts and dig for it', 2, 8000.00 , '07/20/2020' , 2, 8);insert into Staff_Members values ('ahmed.medany' , 5 , 'friday and saturday' ,500000, 'petrolist', 2, 'main@shell.us');

 insert into Regular_Employees values ('ahmed.medany');

 
 /*update Requests 
 set manager_response=1
 where applicant='Ahmed.Amr'*/
 





 
insert into Requests values ('1/1/2017' , 'ahmed.medany' , '1/3/2017' , getdate() , null , 1 , null , null , 'yousra.ellouzy')
insert into Leave_Requests values('1/1/2017' , 'ahmed.medany', 'Annual')






insert into Users values('adel.emam', '123456', 'emam@gmail.com' , '2/3/1998', 2 , 'adel', 'emam','Mohamed');

insert into Projects values ('Update Database','main@shell.us','2/5/2017','12/12/2017','youssef.yasser')
insert into Managers_assign_Project_Regular_Employees values ('Update Database', 'main@shell.us' , 'adel.emam' , 'youssef.yasser')
insert into Staff_Members values('adel.emam',24,'Friday and Sunday',32000,'Trainer',1,'main@shell.us')
insert into Regular_Employees values ('adel.emam')



Insert into Tasks values ('task one','Update Database','main@shell.us', '10/11/2017' , 'Open' , 'update table announcements', 
'adel.emam' , 'youssef.yasser')


update Tasks
set deadline = '12/11/2017'
where name = 'task one'


insert into Requests values ('12/25/2017' , 'fadl.meto' , '12/30/2017' , '12/25/2017', null , null, null, null, null)
insert into Requests values ('12/25/2017' , 'elset.korya' , '12/30/2017' , '12/25/2017', null , null, null, null, null)
insert into Requests values ('12/25/2017' , 'ahmed.medany' , '12/30/2017' , '12/25/2017', null , null, null, null, null)
insert into Requests values ('12/25/2017' , 'ahmed.hisham' , '12/30/2017' , '12/25/2017', null , null, null, null, null)









insert into Projects values('first project' ,'main@shell.us' , '11/11/2017' , '12/12/2017', 'youssef.yasser')

--insert into Tasks values ('first task' , 'second project' , 'main@shell.us','6/1/2018' , 'open','explore oil', 'ahmed.medany', 'yousra.ellouzy');
insert into Tasks values('first task' , 'first project' , 'main@shell.us','6/1/2018' , 'open','explore oil', 'fadl.meto', 'youssef.yasser')









EXEC Register 'wa7ed.keda', 'morganahmedmorgan' , 'wa7edkeda@gmail.com', '4/5/1972', 8 , 'wa7ed' , '7aga' , 'keda'
insert into Staff_Members values('wa7ed.keda',24,'Friday and Sunday',32000,'Trainer',1,'main@shell.us')
insert into Regular_Employees values ('wa7ed.keda')


EXEC Register 'wa7ed.tany', 'morganahmedmorgan' , 'wa7edtany@gmail.com', '4/5/1972', 8 , 'wa7ed' , '7aga' , 'tany'
insert into Staff_Members values('wa7ed.tany',24,'Friday and Sunday',32000,'Trainer',1,'main@shell.us')
insert into Regular_Employees values ('wa7ed.tany')







Insert into Attendance_Records values ('5/5/2017', 'wa7ed.keda', '7:00:00' , '10:00:00')
Insert into Attendance_Records values ('1/1/2017', 'wa7ed.keda', '7:00:00' , '15:00:00')
Insert into Attendance_Records values ('1/3/2017', 'wa7ed.keda', '7:00:00' , '16:00:00')
Insert into Attendance_Records values ('1/3/2017', 'wa7ed.tany', '7:00:00' , '10:00:00')
Insert into Attendance_Records values ('1/4/2017', 'wa7ed.tany', '7:00:00' , '10:00:00')


