Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=Nk8KOo1YEWBEXw4Y7W6WZI69Md9iqE/J+IEAFtUeBtU=;
 b=OhpjCzpl6Cod/CL+1ShURuMLX4AmGIhJkGQDzxpHLzjzdVWNzxJUK1Ydda7KKDXFIW
 DmUpYhCFuJIfC2yT74ZTiNRyU5GaNKFnie2pFvIWnYSXV0ge2DcnR49KYXXA9llOXayE
 blLcaHkqcNWvJM/22FwJcSTtoZvhU68nB03KapScT+66EI0v8oV0+8yMIB+X5v3IgnOW
 /lWwMpoTKLt7idjJzvoVnjd7XqeA022qP4c7uAtb22ei+pJjQrkO5UJE749LcNzfS9Bc
 CpAo364TDfx92o1PxStMW5iOKsDz5fveByZmPf8LOIvZVXX/+dfz58RrF+ajiqJtpj9s
 ls9g==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH 0/8] Bibliography update round 3
Message-ID: <168e7454-5cde-6d7a-238b-f850648dd819@gmail.com>
Date: Mon, 30 Jan 2017 00:26:05 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From f49e93ec4178feeb7b7fdbeb4291051541daf9de Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Sun, 29 Jan 2017 19:57:24 +0900
Subject: [PATCH 0/8] Bibliography update round 3

Hi Paul,

In this patch set, I picked up updates which contain some fixes
other than just appending url or doi.
They seem OK to me, but I want you to check yourself.

The "eprint" field appended in patch 1 is a field whose support has been
added to alphapf style by "urlbst" package. This is the first entry
it is utilized.

                                          Thanks, Akira
--
Akira Yokosawa (8):
  bib/WFS: Add 'eprint' field to DanAlitarh2013PracticalProgress
  bib/swtools: Fix url of SaeedDehnadi2009SheepGoats
  bib/WFS: Add doi to Herlihy93
  bib/syncrefs: Add doi to Kontothanassis97a
  bib/TM: Fix doi of DBLomet1977SIGSOFT
  bib/TM: Correct url of YujieLiu2011ToxicTransactions
  bib/hw: Add doi to TrevorMudge2000Power
  bib/parallelsys: Fix typo of OpenMPI2008's title

 bib/TM.bib          | 12 ++++++++----
 bib/WFS.bib         |  4 +++-
 bib/hw.bib          |  5 +++--
 bib/parallelsys.bib |  2 +-
 bib/swtools.bib     |  3 ++-
 bib/syncrefs.bib    |  5 +++--
 6 files changed, 20 insertions(+), 11 deletions(-)

-- 
2.7.4

