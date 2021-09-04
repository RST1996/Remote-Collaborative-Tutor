ReCT: Remote Collaborative Tutor
The source code folder contains 2 subfoler
1.rect
2.vdl
The 1 is the main rails implementation of the complete system except the VDL.
The 2 is the compiler codes needed for the VDL. Its is in PHP

REQUIREMENTS
1.Rails INstaller
2.XAMPP/WAMPP or any other apache package.

INSTALLATION STEPS
1. COPY THE rect folder where you want to start the server for ReCT.
2. COPY the vdl folder in the web directory of the PHP.
3. Run rails bundle install
	This will install all the necessary gems needed for the operation.
4. Run rails db:migrate 
	This will create the db structure of the rails.
5. Start the PHP apache server
6. Run rails s to start the server.
7. Use localhost:3000 for accessing the ReCT.