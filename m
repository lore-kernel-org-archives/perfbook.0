Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=G7DVIsAh9fUbgYe6g53DFwrCC4ATXJps2u/JBWk76ZU=;
 b=eRRw4fHrf/cFqQXLKLio+dFM70esc0wkKuG3pbLui86d1aqZUp+uZCVySlI6Waew9l
 9OF3+5S3Fhd6M5mt53bpfKqk8uIFYP/YHNEgMl4/t1TOaX8Aq1dulSNry2SNpXkniQL2
 dFNO5ddJXUMTc135fHeOBk0oLP7iVxf6rabai8vfRF/LTwX7GEG/BHCZsikCYNBIZX57
 r0CEYWUoJy+DBhqREr6pam6tlP3HexB3JXBDQniEsCEoKNpNEN5QJr/bzBpsFqDuoHfK
 /o7/x4ugl21cmSoLImjc9mGyRIl7eRcnlvCu2qCaLf8hEtn3cS9g5Ea5crkgNH9tgIvD
 B1Bw==
Subject: [PATCH 7/7] bib/swtools: Salvage url of RichardBornat2006SheepGoats
References: <57534479-f365-a2ba-a282-dd2b36310a0b@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <73ee2359-9e68-8107-54a7-2344833af336@gmail.com>
Date: Mon, 23 Jan 2017 00:07:07 +0900
MIME-Version: 1.0
In-Reply-To: <57534479-f365-a2ba-a282-dd2b36310a0b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 01ba68ac394333779c7745f249df5f78a500e091 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 28 Nov 2016 10:57:25 +0900
Subject: [PATCH 7/7] bib/swtools: Salvage url of RichardBornat2006SheepGoats

Link to "http://www.cs.kent.ac.uk/news/" is lost.
This commit instead uses a link to abstract of the seminar.
It also fixes author and date info.
It also appends a reference to the retraction by the author.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/swtools.bib | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/bib/swtools.bib b/bib/swtools.bib
index 2877997..a970852 100644
--- a/bib/swtools.bib
+++ b/bib/swtools.bib
@@ -254,12 +254,16 @@
 }

 @unpublished{RichardBornat2006SheepGoats
-,Author="Maggie Bowman"
+,Author="Richard Bornat"
 ,Title="Dividing the Sheep from the Goats"
-,month="February"
-,day="20"
+,month="January"
+,day="24"
 ,year="2006"
-,note={\url{http://www.cs.kent.ac.uk/news/2006/RBornat/}}
+,note={Seminar at School of Computing, Univ. of Kent. Abstract is available at
+\url{https://www.cs.kent.ac.uk/seminar_archive/2005_06/abs_2006_01_24.html}.
+Retracted in July 2014:
+\url{http://www.eis.mdx.ac.uk/staffpages/r_bornat/papers/camel_hump_retraction.pdf}}
+,lastchecked="November 28, 2016"
 }

 @inproceedings{SaeedDehnadi2009SheepGoats
-- 
2.7.4


