FROM ubuntu:16.04
MAINTAINER tianh
RUN apt-get update && apt-get install -y subversion

# Default configuration: can be overridden at the docker command line
ENV SVN_REPONAME repos

EXPOSE 3690

RUN mkdir /home/svn
RUN svnadmin create /home/svn/$SVN_REPONAME
ADD svnserve.conf /home/svn/$SVN_REPONAME/conf/svnserve.conf

VOLUME /home/svn

# CMD [ "/usr/bin/svnserve", "--daemon",  "--root", "/home/svn" ]
RUN svnserve -d -r /home/svn