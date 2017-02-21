Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=UVoKF73LTiDt0aOI8rj5wQWDkXrHIlvTj2O7DjI5ufc=;
 b=pVKAhPQI0qgmIM/qMIGyV2/VrI0SYTjdP/Km+U/YDNDh0vQji61ngKTruIWK1TsvNP
 8vm80SoVoaa5qpPpAndpDL5rwNU+vzWFidSGTROyJm1BRMUFHmUPPmASU17dybBZiimj
 wCzejkrabvqLvVosacsnNl5ab6cF+FjQ6nzy8UwF5Sq+Z2jdMjH1XynOapcNrFdP+72Q
 NuZh+jJkfLgj3WIswwIBvyElZsvCpt3wypm+gRkT0spZ878msg84x+ZRRv3rMlwnpKxO
 6/QjhTH+My9FC8+33QDkDY2xBU4bV0MzJQuaaT19Bbw99rLZbSo5W+rWWUEPfxf+Ssav
 rb+g==
Subject: [PATCH 1/2] Bibliography updates (append urls -- part 3)
References: <a3c6603e-ad1d-4fac-436a-66bfc7f04f41@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <bccd562c-7f1e-a980-2eb8-026d2371902f@gmail.com>
Date: Wed, 22 Feb 2017 00:31:37 +0900
MIME-Version: 1.0
In-Reply-To: <a3c6603e-ad1d-4fac-436a-66bfc7f04f41@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 36ff4bafb3066f408202d6d825c817ecf0cc332e Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Fri, 25 Nov 2016 00:24:56 +0900
Subject: [PATCH 1/2] Bibliography updates (append urls -- part 3)

This commit appends urls to the following entries:

  o McKenney02e
  o Takada93
  o Bonwick01slab

McKenney02e's URL at https://www.researchgate.net/ was contributed
by Paul himself, so I assume it should be safe to be appended here.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 bib/os.bib       | 2 ++
 bib/syncrefs.bib | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/bib/os.bib b/bib/os.bib
index 7d48633..19c3455 100644
--- a/bib/os.bib
+++ b/bib/os.bib
@@ -1168,6 +1168,8 @@ and Arbitrary Resources"
 ,booktitle = "{USENIX} Annual Technical Conference, General Track 2001"
 ,pages = "15-33"
 ,year = "2001"
+,url="https://www.usenix.org/legacy/event/usenix01/full_papers/bonwick/bonwick.pdf"
+,lastchecked="November 25, 2016"
 }

 @phdthesis{JanEdlerPhD
diff --git a/bib/syncrefs.bib b/bib/syncrefs.bib
index 4a0b1be..04c405f 100644
--- a/bib/syncrefs.bib
+++ b/bib/syncrefs.bib
@@ -1106,6 +1106,8 @@ Multiprocessors"
 ,address="Tokyo, Japan"
 ,year="1993"
 ,number="93-02"
+,url="http://www.is.s.u-tokyo.ac.jp/library/tech-reports/TR93-02.ps.gz"
+,lastchecked="November 23, 2016"
 }

 @techreport{Craig93
@@ -1228,6 +1230,8 @@ Conference on Parallel and Distributed Computing and Systems"
 ,year=2002
 ,address="Cambridge, MA, USA"
 ,month="November"
+,url="https://www.researchgate.net/publication/221569047_Fairlocks_A_High_Performance_Fair_Locking_Scheme"
+,lastchecked="November 16, 2016"
 }

 @inproceedings{radovic02efficient
-- 
2.7.4


