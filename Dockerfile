#Builds an image with the Python 3.12 image
FROM python:3.12-alpine 

#Sets the working director to /code
WORKDIR /code 

#Sets environment variables used by the 'flask command'
ENV FLASK_APP=app.py

ENV FLASK_RUN_HOST =0.0.0.0 

# Installs 'gcc' and other dependencies
RUN apk add --no-cache gcc musl-dev linux-headers 

# Copies requirements.txt
COPY requirements.txt . 

#Installs the Python dependencies 
RUN pip install -r requirements.txt 

#Copies the current directory in the project to the workdir
COPY . . 

EXPOSE 5000

#sets the default command for the container to flask run --debug
CMD ["flask", "run", "--debug"] 