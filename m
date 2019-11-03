Return-Path: <SRS0=UmAC=Y3=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=lNVunDo1G2nq4gCzyfi6xagcRCLpr7YBa0L2B6Nv/Dg=;
        b=AnwnYgffkGCg/ykjJElN8IRxwjGFSAL1r2vcraOqtcyNlcyKJuDVPF1GqU66s0W8ej
         VvOqKAdkeFhwrJBtYteS6MLsj93LWr+6fkSVBIgkx0uJyA1hOaa0Zk1Hyj3elwCB6GGo
         6IIkCTCtPngLxZKsPLxYXdOd0PMRClewbM7g75tmwLUeTttz/4JqjYK2nVlViq+d60j+
         wCfR6EVNl/ZKKaYtc2wVGpVrsKoWhOjpM3d4vRminsREYlQ67qeSlhp8W2HryXaBdJgz
         jJXXPro+2woPIa0QFzIrAYEM+Xmcot9uWZdzoKK6KWj0/k+YBA66rex9xl6VlVd2vvGD
         bn8Q==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [perfbook GIT PULL] Improve detection of incompatible LaTeX/font
 packages
Message-ID: <75ed5ee1-2e1a-4aa4-8e24-dbcc9fa7850a@gmail.com>
Date: Sun, 3 Nov 2019 10:32:40 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Recently I found out a regression on Ubuntu 16.04 which has a buggy version
of titlesec. The bug omits section numbers in section headers. If you were
on Ubuntu 16.04, you might have noticed the regression.

In response to this regression, I tested perfbook build on some of old
TeX Live releases.  There were other incompatible packages in the past.
So this series adds/improves detection of those incompatible versions.
I have tested the detection on TeX Live releases 2013, 2014, 2015, and 2016.
(2016 is slightly later than the 2015/Debian of Ubuntu 16.04.)

I also updated FAQ-BUILD.txt to reflect the added checks. Now it
emphasizes upgrade of TeX Live. For those who don't like to install
the whole -fonts-extra package, the list of font packages not included
in -fonts-recommended has been completed. 

I also updated FAQ-BUILD.txt to add notes on Fedora issues I found out
while I tried newly released Fedora 31. There are a few glitches and
all current Fedora releases (29--31) has a regression of Ghostscript
affecting (may be not limited to) Figures of gnuplot.

        Thanks, Akira
--
The following changes since commit ff868f8213a26d2a75619973e59b4f33a61a97e5:

  defer/rcuapi: Add pointer to additional hlist_nulls documentation (2019-11-01 07:21:18 -0700)

are available in the Git repository at:

  https://github.com/akiyks/perfbook.git tags/for-paul-2019.11.03a

for you to fetch changes up to 03377d5e27aed775c34663a31661f4796b33c170:

  FAQ-BUILD: Add note on Fedora's Ghostscript regression (2019-11-03 08:53:46 +0900)

----------------------------------------------------------------
Akira Yokosawa (9):
      runfirstlatex.sh: Detect warning of incompatible package version
      Specify required version of 'titlesec' package
      runfirstlatex.sh: Add check of buggy 'listings' package
      runfirstlatex.sh: Add version check of newtx package
      runfirstlatex.sh: Improve detection of incompatible packages
      FAQ-BUILD: Update notes related to added checks
      FAQ-BUILD: Update on Fedora 31
      Makefile: Add existence chech of 'newtx' and 'courier-scaled' fonts
      FAQ-BUILD: Add note on Fedora's Ghostscript regression

 FAQ-BUILD.txt              | 111 +++++++++++++++++++++++++++++++++------------
 Makefile                   |  10 +++-
 perfbook.tex               |   2 +-
 utilities/runfirstlatex.sh |  37 +++++++++++++++
 4 files changed, 129 insertions(+), 31 deletions(-)
