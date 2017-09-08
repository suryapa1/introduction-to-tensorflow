FROM jupyter/tensorflow-notebook:c64b1e33ae52

# launchbot-specific labels
LABEL name.launchbot.io="Introduction to Tensoflow"
LABEL workdir.launchbot.io="/home/jovyan"
LABEL description.launchbot.io="Introduction to Tensoflow"
LABEL 8888.port.launchbot.io="Jupyter Notebook"

# Set the working directory
WORKDIR /home/jovyan

USER root

# Modules
COPY requirements.txt /home/jovyan/requirements.txt
RUN pip install -r /home/jovyan/requirements.txt

USER $NB_USER

# Files to be included
COPY README.md /home/jovyan/
COPY images/ /home/jovyan/images
COPY data/ /home/jovyan/data
COPY *.ipynb /home/jovyan/
COPY tmp/data /home/jovyan/tmp/data

# Expose the notebook port
EXPOSE 8888

# Start the notebook server
CMD jupyter notebook --no-browser --port 8888 --ip=*

