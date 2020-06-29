# pmclights
Pmc Lights  Project (Prototype)

The project loads the live data coming from embedded system to database.
The Admin can manage the street lights of a area.
<h4>Here we recieve the data from embedded system using ftp for this we have created generate_program.py file which fetches the data and store it in our database.<h4>
<p><h5>Installation</h5></p>

<p><h5>Create virtual environment using "virtualenv venv" command</h5></p>
<p><h5>Install required packages using "pip install -r requirements.txt". </h5></p>
<p><h5>Create database in mysql with pmclights as database name. </h5></p>
<p><h5>Create migrations file using "python manage.py makemigrations" </h5></p>
<p><h5>Migrate database using "python manage.py migrate" </h5></p>
<p><h5>Start the app. "python manage.py runserver" </h5></p>
<p><h5>Open the url "Http://127.0.0.1:8000". </h5></p>




