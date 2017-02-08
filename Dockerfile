FROM ubuntu:16.04
MAINTAINER tianh
RUN apt-get update && apt-get install -y subversion
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Default configuration: can be overridden at the docker command line
ENV SVN_REPONAME repos

EXPOSE 3690

RUN mkdir /svn
ADD svn.sh /svn/run
RUN chmod u+x /svn/run

RUN mkdir /home/svn
RUN svnadmin create /home/svn/$SVN_REPONAME
ADD svnserve.conf /home/svn/$SVN_REPONAME/conf/svnserve.conf
ADD passwd /home/svn/$SVN_REPONAME/conf/passwd

VOLUME /home/svn

CMD ["/svn/run"]