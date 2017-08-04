FROM jupyter/tensorflow-notebook:b4dd11e16ae4

# launchbot-specific labels
LABEL name.launchbot.io="Introduction to Tensorflow"
LABEL workdir.launchbot.io="/usr/workdir"
LABEL description.launchbot.io="Introduction to Tensorflow"
LABEL 8888.port.launchbot.io="Jupyter Notebook"
LABEL 8000.port.launchbot.io="Oriole"

# Set the working directory
WORKDIR /usr/workdir

# Modules
COPY requirements.txt /usr/workdir/requirements.txt
RUN pip install -r /usr/workdir/requirements.txt

# Expose the notebook port
EXPOSE 8888

# Start the notebook server
CMD jupyter notebook --no-browser --port 8888 --ip=* --NotebookApp.token=''

