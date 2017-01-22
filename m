Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=2xx51Onh3LBYR096jkfH7xMyvGlVXyV4yrdAsPcjv9Y=;
 b=E/sGaXnFNHEJBBDDf8cgVlNN1gX7x0B3vvFVJ5IIVsTryap3MnTPXGhuU2ha7hWvku
 TVmUwKcyWhhlMlCOSU65JsbrIYbY5PUOp+U9hJuB7QivEVt+5WydJ+stDKkBhc0CVQpf
 RhgLxeuz4VO3NgbmNRAVohDgc78arRu6NTI17TJYkIvai44gLJLjJZ+KQ8xe/qg2Yhmo
 dc0UjSblty/y/W87+n2i5DwPzbFsku/DVpVCXF+XIJrJ8QqCop1+7BDebH17slYlVgTO
 90JlM3rx6UTsVegJssThtYFpu1oEdcn06KIjYkDhuqYr7qPIES5ah40ZsraLEUG/scNy
 /zfQ==
Subject: [PATCH 6/7] bib/syncrefs: Salvage url of DavidUngar2011unsync
References: <57534479-f365-a2ba-a282-dd2b36310a0b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <a279be79-fcb5-24fc-f3d9-4f6c09b3efa7@gmail.com>
Date: Mon, 23 Jan 2017 00:05:18 +0900
MIME-Version: 1.0
In-Reply-To: <57534479-f365-a2ba-a282-dd2b36310a0b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 3008d64c017a885a668e21bc5081ba961a4f32b5 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Wed, 23 Nov 2016 19:02:18 +0900
Subject: [PATCH 6/7] bib/syncrefs: Salvage url of DavidUngar2011unsync

Presentation of this invited talk is available at Dynamic Languages
Symposium's site. Use the url instead and modify conference name
in book title according to the hosted page. (This conference was
co-located with SPLASH 2011.)

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/syncrefs.bib | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
index 9a58a25..8571a57 100644
--- a/bib/syncrefs.bib
+++ b/bib/syncrefs.bib
@@ -1451,12 +1451,13 @@ Parallel Server on UNIX"
 @inproceedings{DavidUngar2011unsync
 ,author={David Ungar}
 ,title="Everything You Know (about Parallel Programming) Is Wrong!: A Wild Screed about the Future"
-,booktitle="Proceedings of the 2011 Systems, Programming Languages and Applications: Software for Humanity (SPLASH) Conference"
-,pages={???-???}
+,booktitle="Dynamic Languages Symposium 2011"
 ,year=2011
 ,address="Portland, OR, USA"
 ,month="October"
-,url={http://splashcon.org/2011/program/245}
+,url="http://dynamic-languages-symposium.org/dls-11/program/media/Ungar_2011_EverythingYouKnowAboutParallelProgrammingIsWrongAWildScreedAboutTheFuture_Dls.pdf"
+,lastchecked="November 23, 2016"
+,note="Invited talk presentation"
 }

 @inproceedings{PaulEMcKenney2012HOTPARsuboptimal
-- 
2.7.4


