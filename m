Return-Path: <SRS0=iSjP=DU=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691075557; x=1691680357;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AFTAKqj3EzkM2ZD6gKDCDGlJ1U4q+AKVafYvjj+HXdw=;
        b=AS+fmz0vG1IFwFqmMjvJh/2AuIickv/2zDEDJVelQli4XcZhCQWBtJZPk6IfGigHSW
         9COGWFZV/UFCz4h0IgN7U+B1rSPP04xWOqTVK2bhPEZX1zTvDLHbs78YqBia6G313zTh
         uX4kmNwXby8z9gDACuE5u3z4wsyPE+ZT+RyATozdjdvr/Sr7B1xYtj0ogQ9mdobRlg9V
         ozGTvWFIVUZ5+HWYY6QW8x9PpizeVIVCuXSk5P2yl09h4N6AIyL9IX4mNp4DMpEEjlic
         KGQpCGQdaZRMDmVqX1bslk1I8h/ya+kQ2yKdUH9BxA5cXkthnTqeNtm3ivewTjUQtKri
         KbYg==
Message-ID: <5446af16-98bd-f062-aee0-9b765490f298@gmail.com>
Date: Fri, 4 Aug 2023 00:12:34 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 4/5] bib: Use lore for LKML archive, take 2
Content-Language: en-US
References: <f0451f2b-bae3-a0b1-6d71-45d434d27b0f@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <f0451f2b-bae3-a0b1-6d71-45d434d27b0f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Archive site at http://marc.theaimsgroup.com/ does not work any more.
Looks like it is moved to https://marc.info/ and the same argument
string works as it did at marc.theaimsgroup.com.
Therefore, it is possible to search lore.kernel.org for the message-id
based URL of the mail.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/RCU.bib | 36 +++++++++++++-----------------------
 bib/os.bib  | 36 ++++++++++++------------------------
 2 files changed, 25 insertions(+), 47 deletions(-)

diff --git a/bib/RCU.bib b/bib/RCU.bib
index 34ea774e18c2..1af9712861d5 100644
--- a/bib/RCU.bib
+++ b/bib/RCU.bib
@@ -357,8 +357,7 @@ Orran Krieger and Rusty Russell and Dipankar Sarma and Maneesh Soni",
  month="March",
  year="2002",
  note="Available:
-\url{http://marc.theaimsgroup.com/?l=linux-kernel&m=101637107412972&w=2}
-[Viewed October 18, 2004]",
+\url{https://lore.kernel.org/lkml/20020317131240.GH22387@krispykreme/}",
 }
 
 @Conference{Linder02a,
@@ -389,8 +388,7 @@ Andrea Arcangeli and Andi Kleen and Orran Krieger and Rusty Russell",
  month="July",
  year="2002",
  note="Available:
-\url{http://marc.theaimsgroup.com/?l=linux-kernel&m=102645767914212&w=2}
-[Viewed June 23, 2004]",
+\url{https://lore.kernel.org/lkml/20020712123751.B19931@in.ibm.com/}",
 }
 
 @unpublished{Barbieri02,
@@ -399,8 +397,7 @@ Andrea Arcangeli and Andi Kleen and Orran Krieger and Rusty Russell",
  month="August",
  year="2002",
  note="Available:
-\url{http://marc.theaimsgroup.com/?l=linux-kernel&m=103082050621241&w=2}
-[Viewed: June 23, 2004]",
+\url{https://lore.kernel.org/lkml/1030820234.4408.119.camel@ldb/}",
 }
 
 @unpublished{Dickins02a,
@@ -417,8 +414,7 @@ Andrea Arcangeli and Andi Kleen and Orran Krieger and Rusty Russell",
  month="October",
  year="2002",
  note="Available:
-\url{http://marc.theaimsgroup.com/?l=linux-kernel&m=103462075416638&w=2}
-[Viewed June 23, 2004]",
+\url{https://lore.kernel.org/lkml/20021015001033.B20643@in.ibm.com/}",
 }
 
 @unpublished{MingmingCao2002IPCRCU,
@@ -558,7 +554,7 @@ Michal Ostrowski and Bryan Rosenburg and Jimi Xenidis",
  Title="{[PATCH]} {RCU} for low latency (experimental)",
  month="March",
  year="2004",
- note="\url{http://marc.theaimsgroup.com/?l=linux-kernel&m=108003746402892&w=2}",
+ note="\url{https://lore.kernel.org/lkml/20040323101755.GC3676@in.ibm.com/}",
 }
 
 @unpublished{Sarma04b,
@@ -566,7 +562,7 @@ Michal Ostrowski and Bryan Rosenburg and Jimi Xenidis",
  Title="Re: {[PATCH]} {RCU} for low latency (experimental)",
  month="March",
  year="2004",
- note="\url{http://marc.theaimsgroup.com/?l=linux-kernel&m=108016474829546&w=2}",
+ note="\url{https://lore.kernel.org/lkml/20040324213914.GD4539@in.ibm.com/}",
 }
 
 @unpublished{Spraul04a,
@@ -575,8 +571,7 @@ Michal Ostrowski and Bryan Rosenburg and Jimi Xenidis",
  month="May",
  year="2004",
  note="Available:
-\url{http://marc.theaimsgroup.com/?l=linux-kernel&m=108546407726602&w=2}
-[Viewed June 23, 2004]",
+\url{https://lore.kernel.org/lkml/200405250535.i4P5ZJo8017583@dbl.q-ag.de/}",
 }
 
 @unpublished{Steiner04a,
@@ -586,8 +581,7 @@ Add per-cpu batch counter",
  month="May",
  year="2004",
  note="Available:
-\url{http://marc.theaimsgroup.com/?l=linux-kernel&m=108551764515332&w=2}
-[Viewed June 23, 2004]",
+\url{https://lore.kernel.org/lkml/20040525203215.GB5127@sgi.com/}",
 }
 
 @Conference{Sarma04c,
@@ -679,8 +673,7 @@ Oregon Health and Sciences University",
  month="October",
  year="2004",
  note="Available:
-\url{http://marc.theaimsgroup.com/?t=109395731700004&r=1&w=2}
-[Viewed October 18, 2004]",
+\url{https://lore.kernel.org/lkml/20040831125941.GA5534@in.ibm.com/}",
 }
 
 @unpublished{Thirumalai04a,
@@ -689,8 +682,7 @@ Oregon Health and Sciences University",
  month="October",
  year="2004",
  note="Available:
-\url{http://marc.theaimsgroup.com/?t=109144217400003&r=1&w=2}
-[Viewed October 18, 2004]",
+\url{https://lore.kernel.org/lkml/20040802101053.GB4385@vitalstatistix.in.ibm.com/}",
 }
 
 @unpublished{Thirumalai04b,
@@ -699,8 +691,7 @@ Oregon Health and Sciences University",
  month="October",
  year="2004",
  note="Available:
-\url{http://marc.theaimsgroup.com/?l=linux-kernel&m=109152521410459&w=2}
-[Viewed October 18, 2004]",
+\url{https://lore.kernel.org/lkml/20040803092316.GE1753@vitalstatistix.in.ibm.com/}",
 }
 
 @unpublished{PaulEMcKenney2004rcu:assign:pointer,
@@ -718,7 +709,7 @@ Oregon Health and Sciences University",
  day="15",
  month="November",
  year="2004",
- note="\url{http://marc.theaimsgroup.com/?l=linux-kernel&m=110054979416004&w=2}",
+ note="\url{https://lore.kernel.org/lkml/Xine.LNX.4.44.0411151448580.21180-100000@thoron.boston.redhat.com/}",
 }
 
 @unpublished{JamesMorris2004SELinuxRCU,
@@ -1697,8 +1688,7 @@ lot of {Linux} into your technology!!!",
  month="February",
  year="2010",
  note="Available:
-\url{https://marc.info/?t=126719855400006&r=1&w=2}
-[Viewed March 20, 2011]",
+\url{https://lore.kernel.org/netdev/E1NlbuT-00021C-0b@gondolin.me.apana.org.au/}",
 }
 
 @mastersthesis{AbhinavDuggal2010Masters,
diff --git a/bib/os.bib b/bib/os.bib
index 05d9f71841a7..a9666f9466a2 100644
--- a/bib/os.bib
+++ b/bib/os.bib
@@ -746,8 +746,7 @@ on Operating Systems Principles",
  month="June",
  year="2002",
  note="Available:
-\url{https://marc.info/?l=linux-kernel&m=102495429606637&w=2}
-[Viewed February 16, 2021]",
+\url{https://lore.kernel.org/lkml/OFE468962D.E4F46C96-ON88256BE2.00755AF2@boulder.ibm.com/}",
 }
 
 @unpublished{McVoy02a,
@@ -840,8 +839,7 @@ on Operating Systems Principles",
  month="October",
  year="2002",
  note="Available:
-\url{https://marc.info/?l=linux-kernel&m=103602621711679&w=2}
-[Viewed February 16, 2021]",
+\url{https://lore.kernel.org/lkml/Pine.LNX.4.44.0210301651120.6719-100000@penguin.transmeta.com/}",
 }
 
 @unpublished{Torvalds2.5.46,
@@ -850,8 +848,7 @@ on Operating Systems Principles",
  month="November",
  year="2002",
  note="Available:
-\url{https://marc.info/?l=linux-kernel&m=103645181102114&w=2}
-[Viewed February 16, 2021]",
+\url{https://lore.kernel.org/lkml/Pine.LNX.4.44.0211041508020.1832-100000@penguin.transmeta.com/}",
 }
 
 @unpublished{Torvalds2.5.53,
@@ -860,8 +857,7 @@ on Operating Systems Principles",
  month="December",
  year="2002",
  note="Available:
-\url{https://marc.info/?l=linux-kernel&m=104070902324592&w=2}
-[Viewed February 16, 2021]",
+\url{https://lore.kernel.org/lkml/Pine.LNX.4.44.0212232141010.1079-100000@penguin.transmeta.com/}",
 }
 
 @unpublished{Torvalds2.5.58,
@@ -870,8 +866,7 @@ on Operating Systems Principles",
  month="January",
  year="2003",
  note="Available:
-\url{https://marc.info/?l=linux-kernel&m=104252528009597&w=2}
-[Viewed February 16, 2021]",
+\url{https://lore.kernel.org/lkml/Pine.LNX.4.44.0301132205550.6784-100000@penguin.transmeta.com/}",
 }
 
 @unpublished{Torvalds2.5.62,
@@ -880,8 +875,7 @@ on Operating Systems Principles",
  month="February",
  year="2003",
  note="Available:
-\url{https://marc.info/?l=linux-kernel&m=104552457430265&w=2}
-[Viewed February 16, 2021]",
+\url{https://lore.kernel.org/lkml/Pine.LNX.4.44.0302171515110.1150-100000@penguin.transmeta.com/}",
 }
 
 @unpublished{Torvalds2.5.64,
@@ -890,8 +884,7 @@ on Operating Systems Principles",
  month="March",
  year="2003",
  note="Available:
-\url{https://marc.info/?l=linux-kernel&m=104683690231395&w=2}
-[Viewed February 16, 2021]",
+\url{https://lore.kernel.org/lkml/Pine.LNX.4.44.0303041944390.3122-100000@home.transmeta.com/}",
 }
 
 @unpublished{Torvalds2.5.69,
@@ -900,8 +893,7 @@ on Operating Systems Principles",
  month="May",
  year="2003",
  note="Available:
-\url{https://marc.info/?l=linux-kernel&m=105209603501299&w=2}
-[Viewed February 16, 2021]",
+\url{https://lore.kernel.org/lkml/Pine.LNX.4.44.0305041739020.1737-100000@home.transmeta.com/}",
 }
 
 @unpublished{Torvalds2.5.70,
@@ -910,8 +902,7 @@ on Operating Systems Principles",
  month="May",
  year="2003",
  note="Available:
-\url{https://marc.info/?l=linux-kernel&m=105400162802746&w=2}
-[Viewed February 16, 2021]",
+\url{https://lore.kernel.org/lkml/Pine.LNX.4.44.0305261903330.2164-100000@home.transmeta.com/}",
 }
 
 @unpublished{Torvalds2.5.71,
@@ -920,8 +911,7 @@ on Operating Systems Principles",
  month="June",
  year="2003",
  note="Available:
-\url{https://marc.info/?l=linux-kernel&m=105562576502426&w=2}
-[Viewed February 16, 2021]",
+\url{https://lore.kernel.org/lkml/Pine.LNX.4.44.0306141411320.2156-100000@home.transmeta.com/}",
 }
 
 @unpublished{Torvalds2.5.73,
@@ -930,8 +920,7 @@ on Operating Systems Principles",
  month="June",
  year="2003",
  note="Available:
-\url{https://marc.info/?l=linux-kernel&m=105630824516148&w=2}
-[Viewed February 16, 2021]",
+\url{https://lore.kernel.org/lkml/Pine.LNX.4.44.0306221150440.17823-100000@old-penguin.transmeta.com/}",
 }
 
 @unpublished{McKenney01c,
@@ -940,8 +929,7 @@ on Operating Systems Principles",
  month="October",
  year="2001",
  note="Available:
-\url{https://marc.info/?l=linux-kernel&m=100259266316456&w=2}
-[Viewed February 16, 2021]",
+\url{https://lore.kernel.org/lkml/200110090155.f991tPt22329@eng4.beaverton.ibm.com/}",
 }
 
 @unpublished{McKenney01d,
-- 
2.25.1


