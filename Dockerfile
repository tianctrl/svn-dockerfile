FROM ubuntu:16.04
MAINTAINER tianh
RUN apt-get update && apt-get install -y subversion vim

# Default configuration: can be overridden at the docker command line
ENV SVN_REPONAME repos

EXPOSE 3690

RUN mkdir /home/svn
RUN svnadmin create /home/svn/$SVN_REPONAME
ADD svnserve.conf /home/svn/$SVN_REPONAME/conf/svnserve.conf
ADD passwd /home/svn/$SVN_REPONAME/conf/passwd
ADD authz /home/svn/$SVN_REPONAME/conf/authz

VOLUME /home/svn

CMD ["-d","-r","/home/svn"]
ENTRYPOINT ["/usr/bin/svnserve"]