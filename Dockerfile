FROM ubuntu:16.04
MAINTAINER tianh
RUN apt-get update && apt-get install -y subversion

# Default configuration: can be overridden at the docker command line
ENV SVN_REPONAME repos

EXPOSE 3690

RUN mkdir /home/svn
RUN svnadmin create /home/svn/$SVN_REPONAME

VOLUME /home/svn

CMD /usr/bin/svnserve -d -r /home/svn